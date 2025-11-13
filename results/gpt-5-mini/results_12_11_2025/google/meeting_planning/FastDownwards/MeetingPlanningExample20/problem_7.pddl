(define (problem meet-joseph-nobhill-problem)
  (:domain meet-joseph-nobhill)

  (:objects
    m0 m172 m180 m255 - minute
  )

  (:init
    (current m0)
    (at chinatown)
    (succ172 m0 m172)
    (succ8 m172 m180)
    (succ75 m180 m255)
    (allowed-meeting-start m180)
  )

  (:goal (and
           (met-joseph)
           (at nobhill)
         )
  )
)