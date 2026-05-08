(define (problem blocks-orange-on-yellow)
  (:domain blocks-manipulator)

  (:objects
    red blue orange yellow - block
    table - object
    s0 s1 s2 - stage
  )

  (:init
    ;; stage ordering and initial current stage
    (next s0 s1)
    (next s1 s2)
    (at s0)

    ;; initial tower: orange on blue, blue on red, red on table
    (on orange blue)
    (on blue red)
    (on red table)

    ;; yellow is on the table
    (on yellow table)

    ;; clear blocks (nothing on top) at start
    (clear orange)
    (clear yellow)

    ;; manipulator hand is empty at start
    (handempty)
  )

  ;; Goal requires the terminal explicit stage s2 and the desired configuration
  (:goal
    (and
      (on orange yellow)
      (at s2)
    )
  )
)