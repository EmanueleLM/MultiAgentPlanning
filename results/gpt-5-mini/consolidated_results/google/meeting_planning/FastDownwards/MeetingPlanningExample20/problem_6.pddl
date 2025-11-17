(define (problem meet-joseph-nobhill-problem)
  (:domain meet-joseph-nobhill)

  (:objects
    m0 m172 m180 m255 - minute

    chinatown nobhill - location
  )

  (:init
    ;; start: 09:00
    (current m0)
    (at chinatown)

    ;; Sparse time relations sufficient to support a feasible schedule:
    ;; - Wait/advance from 09:00 to 11:52 (m0 -> m172)
    ;; - Travel Chinatown -> Nob Hill: 8 minutes (m172 -> m180)
    ;; - Meet Joseph for 75 minutes (m180 -> m255)
    (succ172 m0 m172)
    (succ8 m172 m180)
    (succ75 m180 m255)

    ;; Allow meeting to start at m180 (this encodes Joseph's availability window sparsely;
    ;; m180 corresponds to 12:00, which lies within 11:30-15:15)
    (allowed-meeting-start m180)
  )

  (:goal (and
           (met-joseph)
           (at nobhill)
         )
  )
)