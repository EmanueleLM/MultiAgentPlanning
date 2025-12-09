; Orchestrator audit corrections and applied adjustments:
; - Introduced explicit day objects and a day-successor predicate to enforce strict ordering (no reordering).
; - Replaced any "post-hoc penalty" or quota accounting with irreversible state predicates (unpacked, unshipped, uninspected)
;   so violations become impossible rather than penalizable after the fact.
; - Ensured every action is uniquely prefixed with its originating agent token: packer-, shipper-, inspector-.
; - Enforced "exact" scheduling constraints by requiring actions to occur on the specified days and by requiring successor relations.
; - Removed unsupported constructs (costs, conditional effects, quantifiers). Kept :requirements to :strips, :typing, :negative-preconditions only.
; No additional resources, connectivity, or agents were invented beyond the domain objects declared below.

(define (problem move_item_seq)
  (:domain multiagent-logistics)
  (:objects
    i1 - item
    orig dest - location
    day1 day2 day3 - day
  )
  (:init
    ; initial physical state
    (at i1 orig)

    ; initial bookkeeping to prevent repeated/late actions (these are consumed by actions)
    (unpacked i1)
    (unshipped i1)
    (uninspected i1)

    ; available days (explicit schedule slots)
    (available-day day1)
    (available-day day2)
    (available-day day3)

    ; strict day ordering: day1 -> day2 -> day3
    (day-successor day1 day2)
    (day-successor day2 day3)
  )

  ; Goal fixes mandated terminal conditions exactly:
  ; - item i1 must be at destination
  ; - packing must have occurred on day1
  ; - shipping must have occurred on day2 (successor of day1)
  ; - inspection must have occurred on day3 (successor of day2)
  (:goal (and
    (at i1 dest)
    (packed-on i1 day1)
    (shipped-on i1 day2)
    (inspected-on i1 day3)
  ))
)