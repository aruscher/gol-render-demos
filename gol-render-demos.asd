;;;; gol-render-demos.asd

(asdf:defsystem #:gol-render-demos
  :description "Describe gol-render-demos here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :pathname ""
  :depends-on ("gol-render-demos/oldschool-opengl")
  :components ((:file "package")))

(asdf:defsystem #:gol-render-demos/game
  :description "Describe gol-render-demos here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :pathname "game/"
  :components ((:file "package")
               (:file "game")))

(asdf:defsystem #:gol-render-demos/oldschool-opengl
  :description "Describe gol-render-demos here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :pathname "oldschool-opengl/"
  :depends-on ("sdl2kit" "cl-opengl" "gol-render-demos/game")
  :components ((:file "package")
               (:file "oldschool-opengl")))
