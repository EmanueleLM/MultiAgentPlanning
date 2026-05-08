(define (domain visit_san_francisco)
  (:requirements :strips :typing)
  (:types location friend timepoint)
  (:predicates 
    (at ?loc - location)
    (meeting_with ?f - friend)
    (time ?t - timepoint)
    (met_for_minimum ?f - friend)
    (succeeding_time ?t1 ?t2 - timepoint)
    (jessica_available ?t - timepoint)
  )
  (:constants
    presidio marina_district - location
    jessica - friend
  )
  (:action move_to_marina
    :parameters (?start_time ?end_time - timepoint)
    :precondition (and
      (at presidio)
      (time ?start_time)
      (succeeding_time ?start_time ?end_time)
    )
    :effect (and
      (not (at presidio))
      (at marina_district)
      (not (time ?start_time))
      (time ?end_time)
    )
  )
  (:action move_to_presidio
    :parameters (?start_time ?end_time - timepoint)
    :precondition (and
      (at marina_district)
      (time ?start_time)
      (succeeding_time ?start_time ?end_time)
    )
    :effect (and
      (not (at marina_district))
      (at presidio)
      (not (time ?start_time))
      (time ?end_time)
    )
  )
  (:action start_meeting
    :parameters (?start_time ?end_time - timepoint)
    :precondition (and
      (at marina_district)
      (time ?start_time)
      (jessica_available ?start_time)
      (succeeding_time ?start_time ?end_time)
    )
    :effect (and
      (meeting_with jessica)
      (not (time ?start_time))
      (time ?end_time)
    )
  )
  (:action end_meeting
    :parameters (?end_time - timepoint)
    :precondition (and
      (meeting_with jessica)
      (time ?end_time)
      (at marina_district)
    )
    :effect (and
      (not (meeting_with jessica))
      (met_for_minimum jessica)
    )
  )
)