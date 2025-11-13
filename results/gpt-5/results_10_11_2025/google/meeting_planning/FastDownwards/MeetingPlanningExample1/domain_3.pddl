(define (domain sf_meet_betty_classical)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    t5 rem level rfcount frcount
  )

  (:predicates
    (at-richmond_district)
    (at-financial_district)

    (now ?i - t5 ?r - rem)
    (next5 ?i - t5 ?j - t5)

    (succ-rem ?r1 - rem ?r2 - rem)
    (is-r4 ?r - rem)
    (minute-advance-allowed ?i - t5)

    (met ?l - level)
    (next-level ?l1 - level ?l2 - level)

    (in-rf ?c - rfcount)
    (next-rf ?c1 - rfcount ?c2 - rfcount)

    (in-fr ?c - frcount)
    (next-fr ?c1 - frcount ?c2 - frcount)

    (betty-avail ?i - t5 ?r - rem)
  )

  (:functions (total-cost))

  (:action start-travel-richmond-financial
    :parameters (?i - t5 ?r - rem)
    :precondition (and
      (at-richmond_district)
      (not (at-financial_district))
      (now ?i ?r)
    )
    :effect (and
      (not (at-richmond_district))
      (in-rf rf22)
      (increase (total-cost) 1)
    )
  )

  (:action step-travel-rf-no-carry
    :parameters (?c1 - rfcount ?c2 - rfcount ?i - t5 ?r1 - rem ?r2 - rem)
    :precondition (and
      (in-rf ?c1)
      (next-rf ?c1 ?c2)
      (now ?i ?r1)
      (succ-rem ?r1 ?r2)
    )
    :effect (and
      (not (now ?i ?r1))
      (now ?i ?r2)
      (not (in-rf ?c1))
      (in-rf ?c2)
      (increase (total-cost) 1)
    )
  )

  (:action step-travel-rf-carry
    :parameters (?c1 - rfcount ?c2 - rfcount ?i - t5 ?j - t5 ?r - rem)
    :precondition (and
      (in-rf ?c1)
      (next-rf ?c1 ?c2)
      (now ?i ?r)
      (is-r4 ?r)
      (next5 ?i ?j)
    )
    :effect (and
      (not (now ?i ?r))
      (now ?j r0)
      (not (in-rf ?c1))
      (in-rf ?c2)
      (increase (total-cost) 1)
    )
  )

  (:action finish-travel-rf-no-carry
    :parameters (?i - t5 ?r1 - rem ?r2 - rem)
    :precondition (and
      (in-rf rf1)
      (now ?i ?r1)
      (succ-rem ?r1 ?r2)
    )
    :effect (and
      (not (now ?i ?r1))
      (now ?i ?r2)
      (not (in-rf rf1))
      (at-financial_district)
      (increase (total-cost) 1)
    )
  )

  (:action finish-travel-rf-carry
    :parameters (?i - t5 ?j - t5 ?r - rem)
    :precondition (and
      (in-rf rf1)
      (now ?i ?r)
      (is-r4 ?r)
      (next5 ?i ?j)
    )
    :effect (and
      (not (now ?i ?r))
      (now ?j r0)
      (not (in-rf rf1))
      (at-financial_district)
      (increase (total-cost) 1)
    )
  )

  (:action start-travel-financial-richmond
    :parameters (?i - t5 ?r - rem)
    :precondition (and
      (at-financial_district)
      (not (at-richmond_district))
      (now ?i ?r)
    )
    :effect (and
      (not (at-financial_district))
      (in-fr fr21)
      (increase (total-cost) 1)
    )
  )

  (:action step-travel-fr-no-carry
    :parameters (?c1 - frcount ?c2 - frcount ?i - t5 ?r1 - rem ?r2 - rem)
    :precondition (and
      (in-fr ?c1)
      (next-fr ?c1 ?c2)
      (now ?i ?r1)
      (succ-rem ?r1 ?r2)
    )
    :effect (and
      (not (now ?i ?r1))
      (now ?i ?r2)
      (not (in-fr ?c1))
      (in-fr ?c2)
      (increase (total-cost) 1)
    )
  )

  (:action step-travel-fr-carry
    :parameters (?c1 - frcount ?c2 - frcount ?i - t5 ?j - t5 ?r - rem)
    :precondition (and
      (in-fr ?c1)
      (next-fr ?c1 ?c2)
      (now ?i ?r)
      (is-r4 ?r)
      (next5 ?i ?j)
    )
    :effect (and
      (not (now ?i ?r))
      (now ?j r0)
      (not (in-fr ?c1))
      (in-fr ?c2)
      (increase (total-cost) 1)
    )
  )

  (:action finish-travel-fr-no-carry
    :parameters (?i - t5 ?r1 - rem ?r2 - rem)
    :precondition (and
      (in-fr fr1)
      (now ?i ?r1)
      (succ-rem ?r1 ?r2)
    )
    :effect (and
      (not (now ?i ?r1))
      (now ?i ?r2)
      (not (in-fr fr1))
      (at-richmond_district)
      (increase (total-cost) 1)
    )
  )

  (:action finish-travel-fr-carry
    :parameters (?i - t5 ?j - t5 ?r - rem)
    :precondition (and
      (in-fr fr1)
      (now ?i ?r)
      (is-r4 ?r)
      (next5 ?i ?j)
    )
    :effect (and
      (not (now ?i ?r))
      (now ?j r0)
      (not (in-fr fr1))
      (at-richmond_district)
      (increase (total-cost) 1)
    )
  )

  (:action wait-minute-no-carry-richmond
    :parameters (?i - t5 ?r1 - rem ?r2 - rem)
    :precondition (and
      (at-richmond_district)
      (now ?i ?r1)
      (succ-rem ?r1 ?r2)
      (minute-advance-allowed ?i)
    )
    :effect (and
      (not (now ?i ?r1))
      (now ?i ?r2)
      (increase (total-cost) 1)
    )
  )

  (:action wait-minute-carry-richmond
    :parameters (?i - t5 ?j - t5 ?r - rem)
    :precondition (and
      (at-richmond_district)
      (now ?i ?r)
      (is-r4 ?r)
      (next5 ?i ?j)
    )
    :effect (and
      (not (now ?i ?r))
      (now ?j r0)
      (increase (total-cost) 1)
    )
  )

  (:action wait-minute-no-carry-financial
    :parameters (?i - t5 ?r1 - rem ?r2 - rem)
    :precondition (and
      (at-financial_district)
      (now ?i ?r1)
      (succ-rem ?r1 ?r2)
      (minute-advance-allowed ?i)
    )
    :effect (and
      (not (now ?i ?r1))
      (now ?i ?r2)
      (increase (total-cost) 1)
    )
  )

  (:action wait-minute-carry-financial
    :parameters (?i - t5 ?j - t5 ?r - rem)
    :precondition (and
      (at-financial_district)
      (now ?i ?r)
      (is-r4 ?r)
      (next5 ?i ?j)
    )
    :effect (and
      (not (now ?i ?r))
      (now ?j r0)
      (increase (total-cost) 1)
    )
  )

  (:action meet-betty-minute-no-carry
    :parameters (?i - t5 ?r1 - rem ?r2 - rem ?l1 - level ?l2 - level)
    :precondition (and
      (at-financial_district)
      (now ?i ?r1)
      (succ-rem ?r1 ?r2)
      (betty-avail ?i ?r1)
      (met ?l1)
      (next-level ?l1 ?l2)
    )
    :effect (and
      (not (now ?i ?r1))
      (now ?i ?r2)
      (not (met ?l1))
      (met ?l2)
      (increase (total-cost) 1)
    )
  )

  (:action meet-betty-minute-carry
    :parameters (?i - t5 ?j - t5 ?r - rem ?l1 - level ?l2 - level)
    :precondition (and
      (at-financial_district)
      (now ?i ?r)
      (is-r4 ?r)
      (next5 ?i ?j)
      (betty-avail ?i ?r)
      (met ?l1)
      (next-level ?l1 ?l2)
    )
    :effect (and
      (not (now ?i ?r))
      (now ?j r0)
      (not (met ?l1))
      (met ?l2)
      (increase (total-cost) 1)
    )
  )
)