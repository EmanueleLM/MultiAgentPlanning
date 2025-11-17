(define (problem hanoi_2agents_15_disks_instance17_problem)
  (:domain hanoi_2agents_15_disks_instance17)
  (:objects
    a b c d e f g h i j k l m n o - disk
    left middle right - peg
  )
  (:init
    (at a left) (at b left) (at c left) (at d left) (at e left)
    (at f left) (at g left) (at h left) (at i left) (at j left)
    (at k left) (at l left) (at m left) (at n left) (at o left)
  )
  (:goal (and
    (at f left) (at g left) (at h left) (at i left) (at j left)
    (at k left) (at l left) (at m left) (at n left) (at o left)
    (at a middle) (at b middle) (at d middle) (at e middle)
    (at c right)
  ))
)