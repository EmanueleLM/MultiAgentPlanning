(define (problem tripplanningexample11_problem)
  (:domain tripplanningexample11)

  (:objects
    vienna vilnius valencia - city
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - segment
  )

  (:init
    (current_segment s1)

    (next_segment s1 s2)
    (next_segment s2 s3)
    (next_segment s3 s4)
    (next_segment s4 s5)
    (next_segment s5 s6)
    (next_segment s6 s7)
    (next_segment s7 s8)
    (next_segment s8 s9)
    (next_segment s9 s10)
    (next_segment s10 s11)
    (next_segment s11 s12)
    (next_segment s12 s13)
    (next_segment s13 s14)
    (next_segment s14 s15)

    (direct vienna valencia)
    (direct valencia vienna)
    (direct vilnius vienna)
    (direct vienna vilnius)

    (conference_segment s9)
    (conference_segment s15)
    (final_segment s15)
  )

  (:goal
    (and
      (current_segment s15)
      (at valencia)

      (assigned s1 vienna)
      (assigned s2 vienna)
      (assigned s3 vienna)
      (assigned s4 vienna)
      (assigned s5 vienna)

      (assigned s6 vilnius)
      (assigned s7 vilnius)
      (assigned s8 vilnius)

      (assigned s9 valencia)
      (assigned s10 valencia)
      (assigned s11 valencia)
      (assigned s12 valencia)
      (assigned s13 valencia)
      (assigned s14 valencia)
      (assigned s15 valencia)
    )
  )
)