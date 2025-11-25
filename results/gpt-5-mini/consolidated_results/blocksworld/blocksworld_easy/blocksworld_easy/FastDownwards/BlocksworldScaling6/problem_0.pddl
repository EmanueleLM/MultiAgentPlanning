(define (problem blocks-orange-on-yellow)
  (:domain blocks-manipulator)

  (:objects
    red blue orange yellow - block
    table - object
  )

  ;; Initial state:
  ;; Stack: orange on blue, blue on red, red on table
  ;; Yellow on table and is clear
  ;; Orange is clear (top of stack) and hand is empty
  (:init
    (on blue red)
    (on red table)
    (on orange blue)
    (on yellow table)

    ;; Only the top blocks are clear initially: orange and yellow
    (clear orange)
    (clear yellow)

    ;; Manipulator is not holding anything at start (single-hand constraint)
    (handempty)
  )

  ;; Goal: orange is on top of yellow (explicit terminal condition required)
  (:goal
    (and
      (on orange yellow)
    )
  )
)