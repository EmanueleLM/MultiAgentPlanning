(define (domain san_francisco_day_david)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent person location time meeting_stage
  )

  (:predicates
    (at ?a - agent ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (travel_arrival ?from - location ?to - location ?depart - time ?arrive - time)
    (person_at ?p - person ?l - location)
    (available ?p - person ?t - time)
    (meeting_stage_current ?m - meeting_stage)
    (meeting_stage_next ?m1 - meeting_stage ?m2 - meeting_stage)
    (meeting_started ?p - person)
    (met_requirement ?p - person)
  )

  (:action wait_one_minute
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (not (meeting_started david))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at you ?from)
      (current_time ?depart)
      (travel_arrival ?from ?to ?depart ?arrive)
      (not (meeting_started david))
    )
    :effect (and
      (not (at you ?from))
      (at you ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action start_meeting_minute
    :parameters (?t1 - time ?t2 - time ?m0 - meeting_stage ?m1 - meeting_stage)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available david ?t1)
      (at you chinatown)
      (person_at david chinatown)
      (meeting_stage_current ?m0)
      (meeting_stage_next ?m0 ?m1)
      (not (meeting_started david))
    )
    :effect (and
      (meeting_started david)
      (not (meeting_stage_current ?m0))
      (meeting_stage_current ?m1)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action continue_meeting_minute
    :parameters (?t1 - time ?t2 - time ?m_prev - meeting_stage ?m_next - meeting_stage)
    :precondition (and
      (meeting_started david)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available david ?t1)
      (at you chinatown)
      (person_at david chinatown)
      (meeting_stage_current ?m_prev)
      (meeting_stage_next ?m_prev ?m_next)
      (not (met_requirement david))
    )
    :effect (and
      (not (meeting_stage_current ?m_prev))
      (meeting_stage_current ?m_next)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action finish_meeting_minute
    :parameters (?t1 - time ?t2 - time ?m104 - meeting_stage ?m105 - meeting_stage)
    :precondition (and
      (meeting_started david)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available david ?t1)
      (at you chinatown)
      (person_at david chinatown)
      (meeting_stage_current ?m104)
      (meeting_stage_next ?m104 ?m105)
    )
    :effect (and
      (not (meeting_stage_current ?m104))
      (meeting_stage_current ?m105)
      (met_requirement david)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )
)