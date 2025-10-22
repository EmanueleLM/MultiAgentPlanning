(define (problem blocks-final)
  (:domain blocks-world)
  (:objects
    a b c d e f g h i j k l - block
  )

  ;; Initial state derived from the public information
  (:init
    ;; initial on / ontable relations
    (on a l)
    (on l e)
    (on e i)
    (on i g)
    (ontable g)

    (on d f)
    (on f h)
    (on h j)
    (ontable j)

    (ontable b)
    (ontable c)
    (ontable k)

    ;; initial clear blocks (those with nothing on top)
    (clear a)
    (clear d)
    (clear b)
    (clear c)
    (clear k)

    ;; hand is empty initially
    (handempty)
  )

  ;; Goal: final arrangement after applying the given action sequence
  (:goal (and
    ;; Stack: L on A on B on C on table
    (on l a)
    (on a b)
    (on b c)
    (ontable c)

    ;; Stack: D on F on H on J on table
    (on d f)
    (on f h)
    (on h j)
    (ontable j)

    ;; Stack: E on I on G on table
    (on e i)
    (on i g)
    (ontable g)

    ;; K on table (singleton)
    (ontable k)
  ))
)