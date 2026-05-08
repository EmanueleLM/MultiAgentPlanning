(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    richmond_district financial_district - location
    time_0900 time_0922 time_1715 time_1815 time_1836 time_2145 - time_point
    betty - friend
  )
  (:init
    ;; Starting state
    (at_loc richmond_district)
    (time_at time_0900)

    ;; Temporal ordering chain
    (precedes time_0900 time_0922)
    (precedes time_0922 time_1715)
    (precedes time_1715 time_1815)
    (precedes time_1815 time_1836)
    (precedes time_1836 time_2145)

    ;; Connectivity and travel durations
    ;; Richmond to Financial: 22 minutes. Leaving at 9:00 AM results in arrival at 9:22 AM.
    (travel_time richmond_district financial_district time_0900 time_0922)
    ;; Financial to Richmond: 21 minutes. Leaving at 6:15 PM results in arrival at 6:36 PM.
    (travel_time financial_district richmond_district time_1815 time_1836)

    ;; Meeting window for Betty:
    ;; She is at Financial District from 5:15 PM (17:15) to 9:45 PM (21:45).
    ;; A 60-minute meeting starting at 5:15 PM (17:15) finishes at 6:15 PM (18:15).
    (can_meet betty financial_district time_1715 time_1815)
  )
  (:goal
    (met betty)
  )
)