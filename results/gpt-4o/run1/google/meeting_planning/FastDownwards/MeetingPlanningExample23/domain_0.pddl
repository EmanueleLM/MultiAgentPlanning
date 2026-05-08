(define (domain visit_friends)

  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time)

  (:predicates
    (at ?agent - person ?location - location)
    (meet ?person1 - person ?person2 - person)
    (visited ?location - location)
    (can_meet ?time - time)
    (current_time ?time - time)
    (moving)
  )

  (:constants
    bayview russian_hill - location
    john you - person
    t1 t2 t3 - time
  )

  (:action move_to_russian_hill
    :parameters (?agent - person)
    :precondition (and (at ?agent bayview) (not (visited russian_hill)) (current_time t1))
    :effect (and (moving) (not (at ?agent bayview)))
  )

  (:action arrive_russian_hill
    :parameters (?agent - person)
    :precondition (and (moving))
    :effect (and (at ?agent russian_hill) (visited russian_hill)
                 (not (moving)) (not (current_time t1)) (current_time t2))
  )

  (:action meet_john
    :parameters (?agent - person)
    :precondition (and (at ?agent russian_hill) (can_meet t2) (current_time t2))
    :effect (and (meet ?agent john) (not (can_meet t2)) (can_meet t3) (not (current_time t2)))
  )

  (:action end_meeting
    :parameters (?agent - person)
    :precondition (and (meet ?agent john) (can_meet t3))
    :effect (and (not (can_meet t3)) (current_time t3))
  )
)