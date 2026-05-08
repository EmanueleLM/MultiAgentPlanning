(define (problem meeting_scheduler_monday_instance_problem)
  (:domain meeting_scheduler_monday_instance)

  (:objects
    s_0900 s_0930 s_1000 s_1030 s_1100 s_1130 s_1200 s_1230
    s_1300 s_1330 s_1400 s_1430 s_1500 s_1530 s_1600 s_1630 - slot
  )

  (:init
    (candidate_start s_0900)
    (candidate_start s_0930)
    (candidate_start s_1000)
    (candidate_start s_1030)
    (candidate_start s_1100)
    (candidate_start s_1130)
    (candidate_start s_1200)
    (candidate_start s_1230)
    (candidate_start s_1300)
    (candidate_start s_1330)
    (candidate_start s_1400)
    (candidate_start s_1430)
    (candidate_start s_1500)
    (candidate_start s_1530)
    (candidate_start s_1600)

    (participant_free_for_start bobby s_0900)
    (participant_free_for_start bobby s_0930)
    (participant_free_for_start bobby s_1000)
    (participant_free_for_start bobby s_1030)
    (participant_free_for_start bobby s_1100)
    (participant_free_for_start bobby s_1130)
    (participant_free_for_start bobby s_1200)
    (participant_free_for_start bobby s_1230)
    (participant_free_for_start bobby s_1300)
    (participant_free_for_start bobby s_1330)
    (participant_free_for_start bobby s_1400)
    (participant_free_for_start bobby s_1430)
    (participant_free_for_start bobby s_1500)
    (participant_free_for_start bobby s_1530)
    (participant_free_for_start bobby s_1600)

    (participant_free_for_start scott s_0900)
    (participant_free_for_start scott s_0930)
    (participant_free_for_start scott s_1000)
    (participant_free_for_start scott s_1030)
    (participant_free_for_start scott s_1200)
    (participant_free_for_start scott s_1230)
    (participant_free_for_start scott s_1300)
    (participant_free_for_start scott s_1330)
    (participant_free_for_start scott s_1400)
    (participant_free_for_start scott s_1430)
    (participant_free_for_start scott s_1600)

    (participant_free_for_start kimberly s_0900)
    (participant_free_for_start kimberly s_0930)
    (participant_free_for_start kimberly s_1000)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)