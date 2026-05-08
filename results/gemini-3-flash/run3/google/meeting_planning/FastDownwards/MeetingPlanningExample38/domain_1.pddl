(define (domain meeting_planning)
  (:requirements :strips :typing :action-costs)
  (:types location time)
  (:constants
    union_square north_beach - location
  )
  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (met_margaret)
  )
  (:functions
    (total-cost)
  )
  (:action travel_union_square_to_north_beach
    :parameters (?t_start ?t_end - time)
    :precondition (and (at union_square) (time_at ?t_start))
    :effect (and (not (at union_square)) (at north_beach) (not (time_at ?t_start)) (time_at ?t_end) (increase (total-cost) 10))
  )
  (:action meet_margaret_at_north_beach
    :parameters (?t_start ?t_end - time)
    :precondition (and (at north_beach) (time_at ?t_start))
    :effect (and (met_margaret) (not (time_at ?t_start)) (time_at ?t_end) (increase (total-cost) 45))
  )
)