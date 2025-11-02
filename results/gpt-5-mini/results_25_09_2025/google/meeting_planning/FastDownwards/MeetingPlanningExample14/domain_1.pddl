(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location)
    (current ?t - time)
    (time-le ?t1 - time ?t2 - time)
    (time-next ?t1 - time ?t2 - time)
    (mary-available ?from - time ?to - time)
    (met)
  )

  (:functions (total-cost))

  (:action visitor-wait-until-depart
    :parameters (?tfrom - time)
    :precondition (and
      (at visitor Nob_Hill)
      (current ?tfrom)
      (time-le ?tfrom t1189)
    )
    :effect (and
      (not (current ?tfrom))
      (current t1189)
      (increase (total-cost) 0)
    )
  )

  (:action visitor-travel-nobhill-to-marina
    :parameters ()
    :precondition (and
      (at visitor Nob_Hill)
      (current t1189)
      (time-next t1189 t1200)
    )
    :effect (and
      (not (at visitor Nob_Hill))
      (at visitor Marina_District)
      (not (current t1189))
      (current t1200)
      (increase (total-cost) 11)
    )
  )

  (:action mary-wait-until-available
    :parameters (?tfrom - time)
    :precondition (and
      (at mary Marina_District)
      (current ?tfrom)
      (time-le ?tfrom t1200)
    )
    :effect (and
      (not (current ?tfrom))
      (current t1200)
      (increase (total-cost) 0)
    )
  )

  (:action visitor-meet-mary
    :parameters ()
    :precondition (and
      (at visitor Marina_District)
      (at mary Marina_District)
      (current t1200)
      (mary-available t1200 t1320)
      (time-next t1200 t1320)
    )
    :effect (and
      (met)
      (not (current t1200))
      (current t1320)
      (increase (total-cost) 120)
    )
  )
)