(define (problem floor-tiles-instance)
  (:domain floor-tiles)

  (:objects
    r1 r2 - robot
    a1 a2 a3 b1 b2 b3 - pos
    red blue none - color
  )

  (:init
    ;; Robot starting positions (from the local robot reports)
    (at r1 b1)
    (at r2 b3)

    ;; Grid adjacency (explicit connectivity)
    ;; right links
    (right a1 a2) (right a2 a3)
    (right b1 b2) (right b2 b3)
    ;; left links (inverse)
    (left a2 a1) (left a3 a2)
    (left b2 b1) (left b3 b2)
    ;; up/down links between rows
    (up b1 a1) (up b2 a2) (up b3 a3)
    (down a1 b1) (down a2 b2) (down a3 b3)

    ;; Initial carried colors (from robot local-state reports)
    (carrying r1 none)
    (carrying r2 none)

    ;; All tiles initially clear (unpainted) (from environment public info)
    (clear a1) (clear a2) (clear a3) (clear b1) (clear b2) (clear b3)

    ;; Supply stations (from auditor and robots' reports): which colors are available where.
    ;; These enforce where robots can change to particular colors.
    (supply b1 red)   ;; robot1 start has red available
    (supply b3 blue)  ;; robot2 start has blue available

    ;; Total cost starts at 0
    (= (total-cost) 0)
  )

  ;; Goals: paint specified target tiles exactly as mandated by the specification (hard constraints)
  ;; (All painted facts below are required terminal conditions.)
  (:goal (and
           (painted a1 red)
           (painted a3 blue)
         ))

  ;; Minimize total accumulated action cost
  (:metric minimize (total-cost))
)