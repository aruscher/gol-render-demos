;;;; gol-render-demos.asd

(asdf:defsystem #:gol-render-demos
  :description "Describe gol-render-demos here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :pathname ""
  :depends-on (
               "gol-render-demos/game"
               "gol-render-demos/oldschool-opengl"
               "gol-render-demos/sdl2kit"
               "gol-render-demos/sketch")
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

(asdf:defsystem #:gol-render-demos/sdl2kit
  :description "Describe gol-render-demos here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :pathname "sdl2kit/"
  :depends-on ("sdl2kit" "gol-render-demos/game")
  :components ((:file "package")
               (:file "2d-window")
               (:file "sdl2kit")))

(asdf:defsystem #:gol-render-demos/sketch
  :description "Describe gol-render-demos here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :pathname "sketch/"
  :depends-on ("sketch" "gol-render-demos/game")
  :components ((:file "package")
               (:file "sketch")))
