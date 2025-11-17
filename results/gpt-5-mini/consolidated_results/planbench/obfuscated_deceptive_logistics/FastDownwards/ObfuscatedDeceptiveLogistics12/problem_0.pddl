(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    ; agents (typed)
    player1 - player
    recorder1 - recorder
    auditor1 - auditor

    ; items
    itemA - item

    ; places
    office lab archive - place

    ; phases
    p1 p2 p3 - phase
  )

  (:init
    ; initial agent locations
    (at player1 office)
    (at recorder1 lab)
    (at auditor1 archive)

    ; initial item location
    (item-at itemA office)

    ; phase order and initial active phase
    (phase-next p1 p2)
    (phase-next p2 p3)
    (phase-active p1)

    ; No other fluents hold initially: not processed, not recorded, not archived, not verified, not finalized
  )

  ; Goal: enforce all mandated terminal conditions explicitly.
  (:goal
    (and
      (processed itemA)
      (archived itemA)
      (verified itemA)
      ; final agent positions required by the specification:
      (at player1 lab)
      (at recorder1 archive)
      (at auditor1 archive)
      ; final explicit finalization step (ensures ordering)
      (finalized)
    )
  )
)