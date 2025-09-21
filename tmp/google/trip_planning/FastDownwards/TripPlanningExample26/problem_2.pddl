(define (problem traveler-flights-problem)
  (:domain traveler-flights-domain)

  (:objects
    porto berlin reykjavik - city

    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day

    p_tok1 p_tok2 p_tok3 p_tok4 p_tok5 p_tok6 - token
    b_tok1 b_tok2 b_tok3 b_tok4 b_tok5 - token
    r_tok1 r_tok2 r_tok3 r_tok4 r_tok5 - token
  )

  (:init
    (day-current d0)
    (next-day d0 d1) (next-day d1 d2) (next-day d2 d3) (next-day d3 d4)
    (next-day d4 d5) (next-day d5 d6) (next-day d6 d7) (next-day d7 d8)
    (next-day d8 d9) (next-day d9 d10) (next-day d10 d11) (next-day d11 d12)
    (next-day d12 d13) (next-day d13 d14) (next-day d14 d15) (next-day d15 d16)

    (token-for-city p_tok1 porto) (token-for-city p_tok2 porto) (token-for-city p_tok3 porto)
    (token-for-city p_tok4 porto) (token-for-city p_tok5 porto) (token-for-city p_tok6 porto)

    (token-for-city b_tok1 berlin) (token-for-city b_tok2 berlin) (token-for-city b_tok3 berlin)
    (token-for-city b_tok4 berlin) (token-for-city b_tok5 berlin)

    (token-for-city r_tok1 reykjavik) (token-for-city r_tok2 reykjavik) (token-for-city r_tok3 reykjavik)
    (token-for-city r_tok4 reykjavik) (token-for-city r_tok5 reykjavik)

    (token-available p_tok1) (token-available p_tok2) (token-available p_tok3)
    (token-available p_tok4) (token-available p_tok5) (token-available p_tok6)

    (token-available b_tok1) (token-available b_tok2) (token-available b_tok3)
    (token-available b_tok4) (token-available b_tok5)

    (token-available r_tok1) (token-available r_tok2) (token-available r_tok3)
    (token-available r_tok4) (token-available r_tok5)

    (is-reykjavik reykjavik)

    (direct-flight berlin reykjavik)
    (direct-flight porto berlin)

    (at porto)

    (allowed-meeting d12) (allowed-meeting d13) (allowed-meeting d14) (allowed-meeting d15) (allowed-meeting d16)
  )

  (:goal
    (and
      (day-current d16)
      (not (token-available p_tok1)) (not (token-available p_tok2)) (not (token-available p_tok3))
      (not (token-available p_tok4)) (not (token-available p_tok5)) (not (token-available p_tok6))

      (not (token-available b_tok1)) (not (token-available b_tok2)) (not (token-available b_tok3))
      (not (token-available b_tok4)) (not (token-available b_tok5))

      (not (token-available r_tok1)) (not (token-available r_tok2)) (not (token-available r_tok3))
      (not (token-available r_tok4)) (not (token-available r_tok5))

      (met-friend)
    )
  )

  (:metric minimize (total-cost))
)