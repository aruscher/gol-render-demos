;;;; gol-render-demos.asd

(asdf:defsystem #:gol-render-demos
  :description "A collection of different approaches to render Conway's Game of Life in Common Lisp. "
  :author "Andreas Ruscheinski <andreas.ruscheinski@googlemail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :pathname ""
  :depends-on ("gol-render-demos/game"
               "gol-render-demos/oldschool-opengl"
               "gol-render-demos/sdl2kit"
               "gol-render-demos/sketch")
  :components ())

(asdf:defsystem #:gol-render-demos/game
  :description "A basic implementation of Conway's Game of Life."
  :author "Andreas Ruscheinski <andreas.ruscheinski@googlemail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :pathname "game/"
  :components ((:file "package")
               (:file "game")))

(asdf:defsystem #:gol-render-demos/oldschool-opengl
  :description "An implementation to render Conway's Game of Life using oldschool opengl."
  :author "Andreas Ruscheinski <andreas.ruscheinski@googlemail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :pathname "oldschool-opengl/"
  :depends-on ("sdl2kit" "cl-opengl" "gol-render-demos/game")
  :components ((:file "package")
               (:file "oldschool-opengl")))

(asdf:defsystem #:gol-render-demos/sdl2kit
  :description "An implementation to render Conway's Game of Life using SDL2."
  :author "Andreas Ruscheinski <andreas.ruscheinski@googlemail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :pathname "sdl2kit/"
  :depends-on ("sdl2kit" "gol-render-demos/game")
  :components ((:file "package")
               (:file "2d-window")
               (:file "sdl2kit")))

(asdf:defsystem #:gol-render-demos/sketch
  :description "An implementation to render Conway's Game of Life using sketch."
  :author "Andreas Ruscheinski <andreas.ruscheinski@googlemail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :pathname "sketch/"
  :depends-on ("sketch" "gol-render-demos/game")
  :components ((:file "package")
               (:file "sketch")))
