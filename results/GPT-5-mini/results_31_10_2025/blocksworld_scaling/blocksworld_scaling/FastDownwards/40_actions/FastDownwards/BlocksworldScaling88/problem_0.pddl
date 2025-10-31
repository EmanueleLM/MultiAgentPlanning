(define (problem build-tower-A-to-L)
  (:domain integrated-blocks)
  (:objects
    a b c d e f g h i j k l - block
  )

  ;; Initial state: all blocks are on the table and initially clear.
  ;; (If different initial stacks were provided by agents, those would be used here;
  ;; in absence of specified initial stacks, all blocks start on the table.)
  (:init
    (ontable a) (clear a)
    (ontable b) (clear b)
    (ontable c) (clear c)
    (ontable d) (clear d)
    (ontable e) (clear e)
    (ontable f) (clear f)
    (ontable g) (clear g)
    (ontable h) (clear h)
    (ontable i) (clear i)
    (ontable j) (clear j)
    (ontable k) (clear k)
    (ontable l) (clear l)
  )

  ;; Goal: final tower with l on the table (bottom), then k on l, j on k, ..., a on b (top)
  (:goal
    (and
      (ontable l)
      (on k l)
      (on j k)
      (on i j)
      (on h i)
      (on g h)
      (on f g)
      (on e f)
      (on d e)
      (on c d)
      (on b c)
      (on a b)
    )
  )
)