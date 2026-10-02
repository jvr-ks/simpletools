// jarstarter_helloworld.scala

// scala-cli package -S 3 jarstarter_helloworld.scala --jvm temurin:26 --assembly -f

//> using dep org.typelevel::cats-effect:3.7.1
//> using dep org.typelevel::cats-core:2.13.0
//> using dep org.typelevel::cats-kernel:2.13.0

//> using dep org.scala-lang.modules::scala-swing::latest.release

import cats.effect._
import cats.effect.std.Dispatcher
import cats.effect.unsafe.implicits.global
import cats.syntax.all._

import scala.concurrent.duration._
import scala.swing._
import scala.swing.BorderPanel.Position._

object jarstarter_helloworld extends IOApp.Simple {

  def longRunningTask: IO[String] =
    IO.sleep(5.seconds) *> IO.pure("Done")

  def setStatus(label: Label, text: String): IO[Unit] =
    IO(label.text = text)

  def run: IO[Unit] =
    Dispatcher.parallel[IO].use { dispatcher =>
      for {
        runningRef <- Ref.of[IO, Option[Fiber[IO, Throwable, Unit]]](None)
        done       <- Deferred[IO, Unit]

        _ <- IO {
          val status = new Label("Idle")
          val start  = new Button("Start")
          val cancel = new Button("Cancel")

          val frame = new MainFrame {
            title = "Hello, World!"
            contents = new BorderPanel {
              add(status, North)
              add(new FlowPanel(start, cancel), Center)
            }
            size = new Dimension(300, 140)
          }

          frame.visible = true

          start.reactions += {
            case event.ButtonClicked(_) =>
              dispatcher.unsafeRunAndForget {
                for {
                  old <- runningRef.getAndSet(None)
                  _   <- old.traverse_(_.cancel)
                  fiber <- (for {
                    _ <- setStatus(status, "Hello, World!")
                    r <- longRunningTask
                    _ <- setStatus(status, r)
                  } yield ()).start
                  _ <- runningRef.set(Some(fiber))
                } yield ()
              }
          }

          cancel.reactions += {
            case event.ButtonClicked(_) =>
              dispatcher.unsafeRunAndForget {
                for {
                  fiberOpt <- runningRef.getAndSet(None)
                  _        <- fiberOpt.traverse_(_.cancel)
                  _        <- setStatus(status, "By by!")
                } yield ()
              }
          }

          frame.peer.addWindowListener(new java.awt.event.WindowAdapter {
            override def windowClosed(e: java.awt.event.WindowEvent): Unit =
              dispatcher.unsafeRunAndForget(done.complete(()).void)
          })
        }

        _ <- done.get
      } yield ()
    }
}


