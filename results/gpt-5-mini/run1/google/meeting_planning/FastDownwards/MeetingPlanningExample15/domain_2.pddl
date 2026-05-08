(define (domain meeting_planning_example15)
  (:requirements :strips :typing)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (time_link ?t1 - time ?t2 - time)
    (route ?from - location ?to - location)
    (available ?a - agent ?l - location ?t1 - time ?t2 - time)
    (met ?a - agent ?b - agent)
  )

  ;; Advance an agent in time while staying at the same location
  (:action wait
    :parameters (?a - agent ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?l ?t1) (time_link ?t1 ?t2))
    :effect (and (not (at ?a ?l ?t1)) (at ?a ?l ?t2))
  )

  ;; Travel along an explicitly declared route between locations using a time link.
  ;; Route facts are explicit in the problem and there is no implicit self-loop route.
  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?from ?t1) (route ?from ?to) (time_link ?t1 ?t2))
    :effect (and (not (at ?a ?from ?t1)) (at ?a ?to ?t2))
  )

  ;; Meet action requires both agents to be co-located at the meeting start time,
  ;; that the second agent (the invitee) declared availability for that exact
  ;; (start,end) pair, and a time_link that advances from start to end.
  ;; The meeting effects advance both agents to the meeting end time and record the meeting.
  (:action meet
    :parameters (?a - agent ?b - agent ?l - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?l ?t1) (at ?b ?l ?t1) (available ?b ?l ?t1 ?t2) (time_link ?t1 ?t2))
    :effect (and (met ?a ?b)
                 (not (at ?a ?l ?t1)) (not (at ?b ?l ?t1))
                 (at ?a ?l ?t2) (at ?b ?l ?t2)))
)