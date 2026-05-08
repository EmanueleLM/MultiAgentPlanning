(define (problem blocks-problem)
  (:domain blocks-domain)
  (:objects red orange yellow blue - block)

  (:init
    ;; explicit block membership facts (as provided by sensors)
    (block red)
    (block orange)
    (block yellow)
    (block blue)

    ;; placement facts (initial state)
    (on orange blue)
    (ontable red)
    (ontable blue)
    (ontable yellow)

    ;; clear facts: orange, red, yellow are clear; blue is not listed as clear
    (clear orange)
    (clear red)
    (clear yellow)

    ;; single-agent hand resource initial state
    (handempty)
  )

  (:goal (and
    (on orange blue)
    (on yellow red)
  ))
)