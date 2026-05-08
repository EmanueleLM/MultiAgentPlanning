(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types location time person stage)
  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (can_travel ?l1 ?l2 - location ?t1 ?t2 - time)
    (next_time ?t1 ?t2 - time)
    (person_at ?p - person ?l - location)
    (is_available ?p - person ?t - time)
    (meeting_progress ?p - person ?s - stage)
    (next_stage ?s1 ?s2 - stage)
  )

  (:action travel
    :parameters (?l1 - location ?l2 - location ?t1 - time ?t2 - time)
    :precondition (and (at ?l1) (current_time ?t1) (can_travel ?l1 ?l2 ?t1 ?t2))
    :effect (and (not (at ?l1)) (at ?l2) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (current_time ?t1) (next_time ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time ?s1 - stage ?s2 - stage)
    :precondition (and (at ?l) (person_at ?p ?l) (current_time ?t1) (next_time ?t1 ?t2)
                       (is_available ?p ?t1) (meeting_progress ?p ?s1) (next_stage ?s1 ?s2))
    :effect (and (not (current_time ?t1)) (current_time ?t2)
                 (not (meeting_progress ?p ?s1)) (meeting_progress ?p ?s2))
  )
)