(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time)
  (:predicates
    (at_location ?l - location)
    (current_time ?t - time)
    (can_wait ?t_from - time ?t_to - time)
    (has_met_thomas)
  )

  (:action travel_bayview_to_pacific_heights
    :parameters ()
    :precondition (and (at_location bayview) (current_time t_0900))
    :effect (and (not (at_location bayview)) (at_location pacific_heights) 
                 (not (current_time t_0900)) (current_time t_0923))
  )

  (:action wait
    :parameters (?t_from - time ?t_to - time)
    :precondition (and (current_time ?t_from) (can_wait ?t_from ?t_to))
    :effect (and (not (current_time ?t_from)) (current_time ?t_to))
  )

  (:action meet_thomas_at_pacific_heights
    :parameters ()
    :precondition (and (at_location pacific_heights) (current_time t_1215))
    :effect (and (not (current_time t_1215)) (current_time t_1400) (has_met_thomas))
  )

  (:action travel_pacific_heights_to_bayview
    :parameters ()
    :precondition (and (at_location pacific_heights) (current_time t_1400))
    :effect (and (not (at_location pacific_heights)) (at_location bayview) 
                 (not (current_time t_1400)) (current_time t_1422))
  )
)