(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent player recorder auditor item place phase)

  ; Predicates
  (:predicates
    (at ?a - agent ?p - place)
    (item-at ?i - item ?p - place)
    (holding ?a - agent ?i - item)
    (processed ?i - item)
    (recorded ?i - item)
    (archived ?i - item)
    (verified ?i - item)
    (phase-active ?ph - phase)
    (phase-next ?ph1 - phase ?ph2 - phase)
    (phase-complete ?ph - phase)
    (finalized)
  )

  ; Generic movement for any agent (player, recorder, auditor)
  (:action move
    :parameters (?a - agent ?from - place ?to - place)
    :precondition (and (at ?a ?from) (not (at ?a ?to)))
    :effect (and (at ?a ?to) (not (at ?a ?from)))
  )

  ; paltry: player_agent picks up an item during the first phase; activates next phase.
  (:action paltry
    :parameters (?p - player ?it - item ?loc - place ?ph - phase ?next - phase)
    :precondition
      (and
        (at ?p ?loc)
        (item-at ?it ?loc)
        (phase-active ?ph)
        (phase-next ?ph ?next)
        (not (holding ?p ?it))
      )
    :effect
      (and
        (holding ?p ?it)
        (not (item-at ?it ?loc))
        (not (phase-active ?ph))
        (phase-complete ?ph)
        (phase-active ?next)
      )
  )

  ; sip: player_agent processes the held item during the second phase; places it at the processing place and advances phase.
  (:action sip
    :parameters (?p - player ?it - item ?loc - place ?ph - phase ?next - phase)
    :precondition
      (and
        (at ?p ?loc)
        (holding ?p ?it)
        (phase-active ?ph)
        (phase-next ?ph ?next)
      )
    :effect
      (and
        (not (holding ?p ?it))
        (item-at ?it ?loc)
        (processed ?it)
        (not (phase-active ?ph))
        (phase-complete ?ph)
        (phase-active ?next)
      )
  )

  ; clip: recorder_agent creates a record of a processed item while the final phase is active (no phase transition here).
  (:action clip
    :parameters (?r - recorder ?it - item ?loc - place ?ph - phase)
    :precondition
      (and
        (at ?r ?loc)
        (item-at ?it ?loc)
        (processed ?it)
        (phase-active ?ph)
      )
    :effect
      (and
        (recorded ?it)
      )
  )

  ; wretched: recorder_agent archives a previously recorded item; requires recorder at archive location.
  (:action wretched
    :parameters (?r - recorder ?it - item ?loc - place)
    :precondition
      (and
        (at ?r ?loc)
        (recorded ?it)
        (not (archived ?it))
      )
    :effect
      (and
        (archived ?it)
      )
  )

  ; memory: auditor_agent verifies that an archived item is correctly archived.
  (:action memory
    :parameters (?o - auditor ?it - item ?loc - place)
    :precondition
      (and
        (at ?o ?loc)
        (archived ?it)
        (not (verified ?it))
      )
    :effect
      (and
        (verified ?it)
      )
  )

  ; tightfisted: auditor_agent finalizes the workflow once all terminal conditions hold and agents are in their final positions.
  ; This action enforces the finalization as an explicit step and therefore encodes ordering (it must be the last step).
  (:action tightfisted
    :parameters (?o - auditor ?p - player ?r - recorder ?locP - place ?locR - place ?locO - place ?it - item)
    :precondition
      (and
        (verified ?it)
        (processed ?it)
        (archived ?it)
        (at ?p ?locP)
        (at ?r ?locR)
        (at ?o ?locO)
        (not (finalized))
      )
    :effect
      (and
        (finalized)
      )
  )
)