(define (domain san_francisco_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time-stage)
  (:predicates
    (at ?p - person ?l - location)
    (can_travel ?from - location ?to - location)
    (visited_jeffrey ?p - person)
    (current_time_stage ?s - time-stage)
    (valid_time_stage ?s_prev - time-stage ?s_next - time-stage)
  )
  (:action travel
    :parameters (?p - person ?from - location ?to - location)
    :precondition (and 
                    (at ?p ?from) 
                    (can_travel ?from ?to)
                    (current_time_stage t1) ; Assume t1 is the time stage when traveling can begin
                  )
    :effect (and 
              (not (at ?p ?from))
              (at ?p ?to)
              (not (current_time_stage t1))
              (current_time_stage t2) ; Move to next time stage after traveling
            )
  )
  (:action meet_jeffrey
    :parameters (?p - person)
    :precondition (and 
                    (at ?p financial_district) 
                    (current_time_stage t2) ; Assume t2 is the start time for meeting
                  )
    :effect (and 
              (not (current_time_stage t2)) 
              (current_time_stage t3) ; Assume t3 indicates meeting has progressed sufficiently
              (visited_jeffrey ?p)
            )
  )
)