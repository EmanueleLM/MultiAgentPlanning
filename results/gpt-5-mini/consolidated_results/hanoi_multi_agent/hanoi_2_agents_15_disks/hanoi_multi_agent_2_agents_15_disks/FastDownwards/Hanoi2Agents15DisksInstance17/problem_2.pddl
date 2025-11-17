(define (problem Hanoi2Agents15DisksInstance17-problem)
  (:domain hanoi_2agents_15_disks_instance17)
  (:objects
    a b c d e f g h i j k l m n o - disk
    left middle right - peg
  )
  (:init
    ;; initial positions (all disks on left, top-to-bottom A..O)
    (at a left) (at b left) (at c left) (at d left) (at e left)
    (at f left) (at g left) (at h left) (at i left) (at j left)
    (at k left) (at l left) (at m left) (at n left) (at o left)
  )
  (:goal (and
    ;; goal: left peg top→bottom: F G H I J K L M N O  => these disks must be on left
    (at f left) (at g left) (at h left) (at i left) (at j left)
    (at k left) (at l left) (at m left) (at n left) (at o left)
    ;; middle peg top→bottom: A B D E  => these disks on middle
    (at a middle) (at b middle) (at d middle) (at e middle)
    ;; right peg top→bottom: C
    (at c right)
  ))
)