(define (problem hanoi3agents20_instance21)
  (:domain hanoi_3agents_20disks)

  (:objects
    a b c d e f g h i j k l m n o p q r s t - disk
    left middle right - peg
  )

  (:init
    (on a left) (on b left) (on c left) (on d left) (on e left)
    (on f left) (on g left) (on h left) (on i left) (on j left)
    (on k left) (on l left) (on m left) (on n left) (on o left)
    (on p left) (on q left) (on r left) (on s left) (on t left)

    (top a left)
    (empty middle)
    (empty right)

    (below a b) (below b c) (below c d) (below d e) (below e f)
    (below f g) (below g h) (below h i) (below i j) (below j k)
    (below k l) (below l m) (below m n) (below n o) (below o p)
    (below p q) (below q r) (below r s) (below s t)

    (smaller a b)
    (smaller b c)
    (smaller a d)
  )

  (:goal
    (and
      (on a middle)
      (on b right)
      (on c right)
      (on d left) (on e left) (on f left) (on g left) (on h left)
      (on i left) (on j left) (on k left) (on l left) (on m left)
      (on n left) (on o left) (on p left) (on q left) (on r left)
      (on s left) (on t left)
      (below b c)
      (below d e) (below e f) (below f g) (below g h) (below h i)
      (below i j) (below j k) (below k l) (below l m) (below m n)
      (below n o) (below o p) (below p q) (below q r) (below r s)
      (below s t)
    )
  )
)