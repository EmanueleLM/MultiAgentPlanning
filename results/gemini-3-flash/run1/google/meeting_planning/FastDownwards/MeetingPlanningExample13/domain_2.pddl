(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time)
  (:constants
    presidio north_beach - location
  )
  (:predicates
    (at_loc ?l - location)
    (current_time ?t - time)
    (met_betty)
    (dist_p_nb ?t1 ?t2 - time)
    (dist_nb_p ?t1 ?t2 - time)
    (duration_75 ?t1 ?t2 - time)
    (before ?t1 ?t2 - time)
    (betty_available ?t - time)
  )

  (:action move_presidio_to_north_beach
    :parameters (?t1 ?t2 - time)
    :precondition (and (at_loc presidio) (current_time ?t1) (dist_p_nb ?t1 ?t2))
    :effect (and (not (at_loc presidio)) (at_loc north_beach) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action move_north_beach_to_presidio
    :parameters (?t1 ?t2 - time)
    :precondition (and (at_loc north_beach) (current_time ?t1) (dist_nb_p ?t1 ?t2))
    :effect (and (not (at_loc north_beach)) (at_loc presidio) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action wait
    :parameters (?t1 ?t2 - time)
    :precondition (and (current_time ?t1) (before ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet_betty
    :parameters (?t1 ?t2 - time)
    :precondition (and (at_loc north_beach) 
                       (current_time ?t1) 
                       (duration_75 ?t1 ?t2) 
                       (betty_available ?t1) 
                       (betty_available ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2) (met_betty))
  )
)