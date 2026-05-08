(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  ;; Objects
  (:objects
    o0 o1 o2 o3 o4 o5 o6 o7 o8 o9 o10 o11 o12 o13 - obj
    st0 st1 st2 st3 st4 st5 st6 st7 st8 st9 st10 st11 st12 - stage
  )

  ;; Initial facts
  (:init
    ;; unary predicates
    (cat o0)
    (cat o1)

    (stupendous o2)
    (stupendous o3)

    (sneeze o4)
    (sneeze o5)

    (spring o6)
    (spring o9)

    (hand o12)
    (hand o13)

    (texture o6)
    (texture o7)
    (texture o8)
    (texture o9)
    (texture o10)
    (texture o11)

    ;; collect relations
    (collect o10 o3)
    (collect o11 o3)
    (collect o9  o3)
    (collect o6  o2)
    (collect o7  o2)
    (collect o8  o2)

    ;; next relations
    (next o0 o9)
    (next o1 o9)

    (next o12 o11)
    (next o13 o7)

    (next o4 o8)
    (next o5 o11)

    ;; stage chain (linear, contiguous stages)
    (succ-stage st0 st1)
    (succ-stage st1 st2)
    (succ-stage st2 st3)
    (succ-stage st3 st4)
    (succ-stage st4 st5)
    (succ-stage st5 st6)
    (succ-stage st6 st7)
    (succ-stage st7 st8)
    (succ-stage st8 st9)
    (succ-stage st9 st10)
    (succ-stage st10 st11)
    (succ-stage st11 st12)

    ;; initial at-stage: every object starts at st0 to enforce monotonic progression
    (at-stage o0 st0)
    (at-stage o1 st0)
    (at-stage o2 st0)
    (at-stage o3 st0)
    (at-stage o4 st0)
    (at-stage o5 st0)
    (at-stage o6 st0)
    (at-stage o7 st0)
    (at-stage o8 st0)
    (at-stage o9 st0)
    (at-stage o10 st0)
    (at-stage o11 st0)
    (at-stage o12 st0)
    (at-stage o13 st0)
  )

  ;; Goal: exact terminal next links required
  (:goal (and
    (next o12 o10)
    (next o13 o9)
  ))
)