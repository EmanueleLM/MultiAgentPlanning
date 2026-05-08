(define (problem schedule_meeting)
  (:domain meeting_scheduling)
  (:objects 
    alexander elizabeth walter - participant
    timeslot_9_9_30 timeslot_9_30_10 timeslot_10_10_30 timeslot_10_30_11
    timeslot_11_11_30 timeslot_11_30_12 timeslot_12_12_30 timeslot_12_30_13
    timeslot_13_13_30 timeslot_13_30_14 timeslot_14_14_30 timeslot_14_30_15
    timeslot_15_15_30 timeslot_15_30_16 timeslot_16_16_30 - timeslot
  )
  
  (:init
    ; Alexander's Schedule
    (busy alexander timeslot_9_30_10)
    (busy alexander timeslot_10_30_11)
    (busy alexander timeslot_12_30_13)
    (busy alexander timeslot_14_30_15)
    (busy alexander timeslot_16_16_30)
   
    ; Elizabeth's Schedule
    (busy elizabeth timeslot_9_9_30)
    (busy elizabeth timeslot_11_30_12)
    (busy elizabeth timeslot_13_13_30)
    (busy elizabeth timeslot_14_14_30)

    ; Walter's Schedule
    (busy walter timeslot_9_9_30)
    (busy walter timeslot_9_30_10)
    (busy walter timeslot_10_10_30)
    (busy walter timeslot_10_30_11)
    (busy walter timeslot_11_11_30)
    (busy walter timeslot_11_30_12)
    (busy walter timeslot_12_12_30)
    (busy walter timeslot_12_30_13)
    (busy walter timeslot_13_13_30)
    (busy walter timeslot_14_14_30)
    (busy walter timeslot_15_30_16)
    (busy walter timeslot_16_16_30)

    ; Initially assume all timeslots are available for checking
  )
  
  (:goal
    (exists (?t - timeslot) (meeting_scheduled ?t))
  )
)