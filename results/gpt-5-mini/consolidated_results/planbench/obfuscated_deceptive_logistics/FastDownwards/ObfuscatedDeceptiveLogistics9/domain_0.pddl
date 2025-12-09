(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent day task)

  (:predicates
    (current-day ?d - day)
    (successor ?d1 ?d2 - day)
    (done ?t - task)
    (performed-by ?t ?a - agent)
  )

  ;; Observer fragment action: must be executed on day1 and only once
  (:action obs_collect
    :parameters ()
    :precondition (and
                    (current-day day1)
                    (not (done collect))
                  )
    :effect (and
              (done collect)
              (performed-by collect observer)
            )
  )

  ;; Advance day from day1 to day2: contiguous progression and only allowed after collect completed
  (:action advance_day_d1_d2
    :parameters ()
    :precondition (and
                    (current-day day1)
                    (done collect)
                    (not (current-day day2))
                  )
    :effect (and
              (not (current-day day1))
              (current-day day2)
            )
  )

  ;; Reasoner fragment action: analyze must occur on day2 and only after collect
  (:action rsn_analyze
    :parameters ()
    :precondition (and
                    (current-day day2)
                    (done collect)
                    (not (done analyze))
                  )
    :effect (and
              (done analyze)
              (performed-by analyze reasoner)
            )
  )

  ;; Advance day from day2 to day3: contiguous progression and only allowed after analyze completed
  (:action advance_day_d2_d3
    :parameters ()
    :precondition (and
                    (current-day day2)
                    (done analyze)
                    (not (current-day day3))
                  )
    :effect (and
              (not (current-day day2))
              (current-day day3)
            )
  )

  ;; Auditor fragment action: remediate must occur on day3 and only after analyze
  (:action aud_remediate
    :parameters ()
    :precondition (and
                    (current-day day3)
                    (done analyze)
                    (not (done remediate))
                  )
    :effect (and
              (done remediate)
              (performed-by remediate auditor)
            )
  )
)