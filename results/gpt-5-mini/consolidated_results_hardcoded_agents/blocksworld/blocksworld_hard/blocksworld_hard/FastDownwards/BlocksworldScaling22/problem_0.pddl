(define (problem blocksworld-problem-1)
  (:domain blocksworld)
  (:objects
    a b c table - object
  )
  (:init
    ;; object classifications
    (block a)
    (block b)
    (block c)
    (table table)

    ;; initial placement: all blocks start on the table and are clear
    (ontable a)
    (ontable b)
    (ontable c)
    (on a table)
    (on b table)
    (on c table)

    (clear a)
    (clear b)
    (clear c)

    ;; robot state
    (handempty)
  )
  (:goal (and
    ;; final required tower: a on b, b on c, and c on the table
    (on a b)
    (on b c)
    (ontable c)

    ;; final housekeeping constraints (enforced as hard terminal conditions)
    (handempty)   ;; agent must be free-handed at the end
    (clear a)     ;; top block must be clear (nothing on top of it)
  ))
)