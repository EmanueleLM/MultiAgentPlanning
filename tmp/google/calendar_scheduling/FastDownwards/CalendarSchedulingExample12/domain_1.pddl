(define (domain multi_agent_meeting_scheduler)
  (:requirements :typing)
  (:types person time meeting)

  (:predicates
     (available1 ?p - person ?t - time)
     (available2 ?p - person ?t - time)
     (available3 ?p - person ?t - time)
     (slot60 ?t - time)
     (global-scheduled ?t - time)
     (scheduled3 ?m - meeting ?t - time)
  )

  (:action schedule_meeting_A1
     :parameters (?start - time)
     :precondition (and
       (available1 david ?start)
       (available1 debra ?start)
       (available1 kevin ?start))
     :effect (and
       (not (available1 david ?start))
       (not (available1 debra ?start))
       (not (available1 kevin ?start))
       (global-scheduled ?start))
  )

  (:action schedule_meeting_A2
     :parameters (?start - time)
     :precondition (and
                    (available2 david ?start)
                    (available2 debra ?start)
                    (available2 kevin ?start)
                    (slot60 ?start))
     :effect (and
       (not (available2 david ?start))
       (not (available2 debra ?start))
       (not (available2 kevin ?start))
       (global-scheduled ?start))
  )

  (:action schedule_meeting_A3_09
     :parameters ()
     :precondition (and (available3 david t9)
                        (available3 debra t9)
                        (available3 kevin t9))
     :effect (and (not (available3 david t9))
                  (not (available3 debra t9))
                  (not (available3 kevin t9))
                  (scheduled3 team_meeting t9)
                  (global-scheduled t9))
  )

  (:action schedule_meeting_A3_10
     :parameters ()
     :precondition (and (available3 david t10)
                        (available3 debra t10)
                        (available3 kevin t10))
     :effect (and (not (available3 david t10))
                  (not (available3 debra t10))
                  (not (available3 kevin t10))
                  (scheduled3 team_meeting t10)
                  (global-scheduled t10))
  )

  (:action schedule_meeting_A3_11
     :parameters ()
     :precondition (and (available3 david t11)
                        (available3 debra t11)
                        (available3 kevin t11))
     :effect (and (not (available3 david t11))
                  (not (available3 debra t11))
                  (not (available3 kevin t11))
                  (scheduled3 team_meeting t11)
                  (global-scheduled t11))
  )

  (:action schedule_meeting_A3_14
     :parameters ()
     :precondition (and (available3 david t14)
                        (available3 debra t14)
                        (available3 kevin t14))
     :effect (and (not (available3 david t14))
                  (not (available3 debra t14))
                  (not (available3 kevin t14))
                  (scheduled3 team_meeting t14)
                  (global-scheduled t14))
  )

  (:action schedule_meeting_A3_15
     :parameters ()
     :precondition (and (available3 david t15)
                        (available3 debra t15)
                        (available3 kevin t15))
     :effect (and (not (available3 david t15))
                  (not (available3 debra t15))
                  (not (available3 kevin t15))
                  (scheduled3 team_meeting t15)
                  (global-scheduled t15))
  )

  (:action schedule_meeting_A3_16
     :parameters ()
     :precondition (and (available3 david t16)
                        (available3 debra t16)
                        (available3 kevin t16))
     :effect (and (not (available3 david t16))
                  (not (available3 debra t16))
                  (not (available3 kevin t16))
                  (scheduled3 team_meeting t16)
                  (global-scheduled t16))
  )
)