(define (problem multi-agent-meet-problem)
  (:domain multi-agent-meet)
  (:objects
     fishermans_wharf nob_hill - location
     t9_00 t14_15 t14_25 t14_35 t14_45 t14_55 t15_05 t15_15 t15_25 t15_35 - timepoint
  )

  (:init
     (visitor_at fishermans_wharf)
     (kenneth_at fishermans_wharf)
     (at_time t9_00)

     (next_time t9_00 t14_15)
     (next_time t14_15 t14_25)
     (next_time t14_25 t14_35)
     (next_time t14_35 t14_45)
     (next_time t14_45 t14_55)
     (next_time t14_55 t15_05)
     (next_time t15_05 t15_15)
     (next_time t15_15 t15_25)
     (next_time t15_25 t15_35)

     (meet_p0)
  )

  (:goal (met_kenneth))
)