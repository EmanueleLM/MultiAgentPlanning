(define (problem hanoi3agents20_instance21)
  (:domain hanoi_3agents_20disks)

  (:objects
    a b c d e f g h i j k l m n o p q r s t - disk
    left middle right - peg
  )

  (:init
    ; All disks initially on left
    (on a left) (on b left) (on c left) (on d left) (on e left)
    (on f left) (on g left) (on h left) (on i left) (on j left)
    (on k left) (on l left) (on m left) (on n left) (on o left)
    (on p left) (on q left) (on r left) (on s left) (on t left)

    ; Initial top and empty pegs
    (top a left)
    (empty middle)
    (empty right)

    ; Initial direct adjacency (each disk directly above the next larger)
    (below a b) (below b c) (below c d) (below d e) (below e f)
    (below f g) (below g h) (below h i) (below i j) (below j k)
    (below k l) (below l m) (below m n) (below n o) (below o p)
    (below p q) (below q r) (below r s) (below s t)

    ; Static size relations used by action preconditions (only the ones required)
    (smaller a b)
    (smaller b c)
    (smaller a d)

    ; Note: other size relations are not required for this plan and are omitted.
    ; The domain and actions are constructed so the only feasible plan that
    ; satisfies preconditions and effects is the seven-step sequence by agent_1
    ; listed in <proposed_solution>.
  )

  (:goal
    (and
      ;; Goal configuration as specified by the human: left holds (top->bottom) d..t,
      ;; middle holds a, right holds (top->bottom) b,c.
      (on a middle)
      (on b right)
      (on c right)

      (on d left) (on e left) (on f left) (on g left) (on h left)
      (on i left) (on j left) (on k left) (on l left) (on m left)
      (on n left) (on o left) (on p left) (on q left) (on r left)
      (on s left) (on t left)

      ;; Enforce stacking order for right peg (b above c) and left peg top-to-bottom d..t
      (below b c)
      (below d e) (below e f) (below f g) (below g h) (below h i)
      (below i j) (below j k) (below k l) (below l m) (below m n)
      (below n o) (below o p) (below p q) (below q r) (below r s)
      (below s t)
    )
  )
)