(define (problem multi-agent-hanoi-problem)
  (:domain multi-agent-hanoi)
  (:objects
    a b c e f g h i j - disk
    left1 middle1 right1 left2 middle2 right2 left3 middle3 right3 - peg
  )

  (:init
    ;; Agent 1 initial tower on left1: c (bottom), b, a (top)
    (on c left1) (on b left1) (on a left1)
    (clear a)
    ;; b and c not clear initially (implicitly)
    (not (empty left1))

    ;; middle1 and right1 initially empty
    (empty middle1) (empty right1)

    ;; Agent 2 initial tower on left2: g (bottom), f, e (top)
    (on g left2) (on f left2) (on e left2)
    (clear e)
    (not (empty left2))
    (empty middle2) (empty right2)

    ;; Agent 3 initial tower on left3: j (top), i, h (bottom)
    ;; (Note: ordering is j above i above h; j and i and h can be arbitrary sizes)
    (on j left3) (on i left3) (on h left3)
    (clear j)
    (not (empty left3))
    (empty middle3) (empty right3)

    ;; Size relations within each group's disks (smaller d1 d2 means d1 < d2)
    ;; Agent 1 sizes: a < b < c
    (smaller a b) (smaller a c) (smaller b c)

    ;; Agent 2 sizes: e < f < g
    (smaller e f) (smaller e g) (smaller f g)

    ;; Agent 3 sizes: h < i < j
    (smaller h i) (smaller h j) (smaller i j)
  )

  (:goal (and
    ;; Global requirement: disk C (c) must be on the right peg for agent 1 (right1)
    (on c right1)
    ;; Ending left configuration for agent 1: a and b on left1 with a clear (on top)
    (on a left1) (on b left1) (clear a)
  ))
)