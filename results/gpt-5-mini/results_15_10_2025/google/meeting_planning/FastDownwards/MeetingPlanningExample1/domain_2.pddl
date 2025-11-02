(define (domain multiagent-meeting)
  (:requirements :typing :negative-preconditions :action-costs :adl)
  (:types agent location time)
  (:predicates
    (at-time ?ag - agent ?loc - location ?t - time)
    (available ?ag - agent ?t - time)
    (met ?a - agent ?b - agent)
    (travel-time-rf-22)
    (meeting-duration-60)
  )

  (:action travel-rf-540-562
    :parameters (?ag - agent)
    :precondition (and
      (at-time ?ag richmond-district t540)
      (travel-time-rf-22)
    )
    :effect (and
      (not (at-time ?ag richmond-district t540))
      (at-time ?ag financial-district t562)
    )
    :cost 22
  )

  (:action travel-rf-1013-1035
    :parameters (?ag - agent)
    :precondition (and
      (at-time ?ag richmond-district t1013)
      (travel-time-rf-22)
    )
    :effect (and
      (not (at-time ?ag richmond-district t1013))
      (at-time ?ag financial-district t1035)
    )
    :cost 22
  )

  (:action wait-540-1013
    :parameters (?ag - agent ?loc - location)
    :precondition (at-time ?ag ?loc t540)
    :effect (and
      (not (at-time ?ag ?loc t540))
      (at-time ?ag ?loc t1013)
    )
    :cost 473
  )

  (:action wait-562-1013
    :parameters (?ag - agent ?loc - location)
    :precondition (at-time ?ag ?loc t562)
    :effect (and
      (not (at-time ?ag ?loc t562))
      (at-time ?ag ?loc t1013)
    )
    :cost 451
  )

  (:action wait-1013-1035
    :parameters (?ag - agent ?loc - location)
    :precondition (at-time ?ag ?loc t1013)
    :effect (and
      (not (at-time ?ag ?loc t1013))
      (at-time ?ag ?loc t1035)
    )
    :cost 22
  )

  (:action meet-1035-1095
    :parameters (?a - agent ?b - agent)
    :precondition (and
      (at-time ?a financial-district t1035)
      (at-time ?b financial-district t1035)
      (available ?b t1035)
      (available ?b t1095)
      (meeting-duration-60)
    )
    :effect (and
      (not (at-time ?a financial-district t1035))
      (not (at-time ?b financial-district t1035))
      (at-time ?a financial-district t1095)
      (at-time ?b financial-district t1095)
      (met ?a ?b)
      (met ?b ?a)
    )
    :cost 60
  )
)