(define (problem deliver-package-problem)
  (:domain delivery-domain)
  (:objects
    player observer - agent
    locA locB locC - location
    package - item
  )

  (:init
    ;; Agent positions
    (at player locA)
    (at observer locC)

    ;; Item initial position
    (at-item package locB)

    ;; Hands are free initially
    (handfree player)
    (handfree observer)

    ;; Connectivity (symmetric edges explicitly listed)
    (connected locA locB)
    (connected locB locA)
    (connected locB locC)
    (connected locC locB)
  )

  ;; Goal: package at locC
  (:goal (and (at-item package locC)))
)