(define (problem trip-11days-integrated)
  (:domain trip-multiagent)

  (:objects
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    r0 r1 r2 - reykcount
    v0 v1 v2 v3 v4 v5 - viennacount
    e0 e1 e2 e3 e4 - venicecount
  )

  (:init
    (at reykjavik)
    (flight reykjavik vienna)
    (flight vienna reykjavik)
    (flight vienna venice)
    (flight venice vienna)

    (current_day d0)
    (succ d0 d1) (succ d1 d2) (succ d2 d3) (succ d3 d4)
    (succ d4 d5) (succ d5 d6) (succ d6 d7) (succ d7 d8)
    (succ d8 d9) (succ d9 d10) (succ d10 d11)

    (reyk_count r0)
    (reyk_succ_count r0 r1) (reyk_succ_count r1 r2)

    (vienna_count v0)
    (vienna_succ_count v0 v1) (vienna_succ_count v1 v2)
    (vienna_succ_count v2 v3) (vienna_succ_count v3 v4)
    (vienna_succ_count v4 v5)

    (venice_count e0)
    (venice_succ_count e0 e1) (venice_succ_count e1 e2)
    (venice_succ_count e2 e3) (venice_succ_count e3 e4)

    (wedding_day d8) (wedding_day d9) (wedding_day d10) (wedding_day d11)
  )

  (:goal (and
    (current_day d11)
    (reyk_count r2)
    (vienna_count v5)
    (venice_count e4)
    (attended_wedding)
  ))
)