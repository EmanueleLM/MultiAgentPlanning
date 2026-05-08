(define (domain depot-hoist-audited)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent device crate pallet location)

  (:predicates
    ;; positions
    (hoist-at ?h - device ?l - location)
    (at ?c - crate ?l - location)
    (at-pallet ?p - pallet ?l - location)               ; pallet location
    (operator-at ?a - agent ?l - location)

    ;; roles and resources
    (hoist-free ?h - device)
    (holding ?h - device ?c - crate)

    ;; task ordering / status predicates required by auditor
    (lifted ?c - crate)                                 ; crate has been released by hoist at the pallet location
    (on ?c - crate ?p - pallet)                         ; final predicate: crate on pallet
    (target ?c - crate ?p - pallet)                     ; mapping from crate to its required pallet

    ;; role indicators (agents are tagged with their role)
    (hoist-operator ?a - agent)
    (depot-operator ?a - agent)
  )

  ;; HOIST OPERATOR ATTACHES HOOK TO A CRATE
  (:action attach-hook
    :parameters (?h - device ?hop - agent ?c - crate ?l - location)
    :precondition (and
      (hoist-at ?h ?l)
      (operator-at ?hop ?l)
      (hoist-operator ?hop)
      (at ?c ?l)
      (hoist-free ?h)
    )
    :effect (and
      (not (hoist-free ?h))
      (holding ?h ?c)
    )
  )

  ;; MOVE HOIST WHILE HOLDING A CRATE: updates hoist location and crate location
  (:action move-hoist-loaded
    :parameters (?h - device ?c - crate ?from - location ?to - location)
    :precondition (and
      (hoist-at ?h ?from)
      (holding ?h ?c)
      (at ?c ?from)
    )
    :effect (and
      (not (hoist-at ?h ?from))
      (hoist-at ?h ?to)
      (not (at ?c ?from))
      (at ?c ?to)
    )
  )

  ;; MOVE HOIST WHEN EMPTY
  (:action move-hoist-empty
    :parameters (?h - device ?from - location ?to - location)
    :precondition (and
      (hoist-at ?h ?from)
      (hoist-free ?h)
    )
    :effect (and
      (not (hoist-at ?h ?from))
      (hoist-at ?h ?to)
    )
  )

  ;; HOIST OPERATOR DETACHES HOOK AT THE TARGET PALLET LOCATION
  ;; Auditor constraint: detachment only permitted at the crate's designated target pallet location
  (:action detach-hook-at-target
    :parameters (?h - device ?hop - agent ?c - crate ?p - pallet ?l - location)
    :precondition (and
      (holding ?h ?c)
      (hoist-at ?h ?l)
      (operator-at ?hop ?l)
      (hoist-operator ?hop)
      (at-pallet ?p ?l)
      (target ?c ?p)
    )
    :effect (and
      (not (holding ?h ?c))
      (hoist-free ?h)
      (lifted ?c)
    )
  )

  ;; DEPOT OPERATOR PLACES THE CRATE ON ITS TARGET PALLET
  ;; Strict constraint: must be at the same location as the pallet and the crate must have been lifted and released there
  (:action place-on-pallet
    :parameters (?dep - agent ?c - crate ?p - pallet ?l - location)
    :precondition (and
      (depot-operator ?dep)
      (operator-at ?dep ?l)
      (at ?c ?l)
      (at-pallet ?p ?l)
      (lifted ?c)
      (target ?c ?p)
      (not (on ?c ?p))
    )
    :effect (and
      (on ?c ?p)
      (not (lifted ?c))
    )
  )

  ;; AGENT MOVEMENT (both depot and hoist operators can move)
  (:action move-operator
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (operator-at ?a ?from)
    :effect (and
      (not (operator-at ?a ?from))
      (operator-at ?a ?to)
    )
  )
)