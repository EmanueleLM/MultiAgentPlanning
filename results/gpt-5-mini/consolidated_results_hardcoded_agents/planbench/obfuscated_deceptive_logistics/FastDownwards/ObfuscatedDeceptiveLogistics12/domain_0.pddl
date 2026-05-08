(define (domain manipulator-domain)
  ; Comments / modeling choices:
  ; - Three distinct agents are modeled explicitly: a manipulator, an inspector, and an auditor.
  ; - Locations are explicitly typed as loc objects (source, assembly, inspection, storage).
  ; - Parts must follow a strict, enforced sequence: assemble -> inspect -> store -> audit.
  ;   This is enforced by action preconditions: inspection requires assembled; placing into storage
  ;   requires inspected; auditing requires assembled+inspected+part located in storage.
  ; - The manipulator holds at most one part at a time using handempty / holding predicates.
  ; - No penalty or bookkeeping actions are used. All preferences from the specification are encoded
  ;   as hard preconditions so violating plans are impossible.
  ; - Negative preconditions are used only to distinguish storage vs non-storage placement.
  (:requirements :strips :typing :negative-preconditions)
  (:types agent part loc)

  (:predicates
    ; agent role tags
    (manipulator ?a - agent)
    (inspector ?a - agent)
    (auditor ?a - agent)

    ; agent and part locations
    (at ?a - agent ?l - loc)
    (at-part ?p - part ?l - loc)

    ; manipulator holding state
    (holding ?a - agent ?p - part)
    (handempty ?a - agent)

    ; processing state of parts
    (assembled ?p - part)
    (inspected ?p - part)
    (audited ?p - part)

    ; station classification predicates for locations
    (source ?l - loc)
    (assembly-station ?l - loc)
    (inspection-station ?l - loc)
    (storage ?l - loc)
  )

  ; Move any agent between locations
  (:action move
    :parameters (?a - agent ?from - loc ?to - loc)
    :precondition (and (at ?a ?from))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )

  ; Manipulator picks a part from a location into its hand (only manipulator can pick)
  (:action pick
    :parameters (?a - agent ?p - part ?loc - loc)
    :precondition (and (manipulator ?a) (at ?a ?loc) (at-part ?p ?loc) (handempty ?a))
    :effect (and (not (at-part ?p ?loc)) (holding ?a ?p) (not (handempty ?a)))
  )

  ; Manipulator places a held part at a non-storage location (e.g., assembly, inspection)
  (:action place-non-storage
    :parameters (?a - agent ?p - part ?loc - loc)
    :precondition (and (manipulator ?a) (at ?a ?loc) (holding ?a ?p) (not (storage ?loc)))
    :effect (and (at-part ?p ?loc) (not (holding ?a ?p)) (handempty ?a))
  )

  ; Manipulator places a held part into storage (only allowed if the part was inspected)
  (:action place-storage
    :parameters (?a - agent ?p - part ?loc - loc)
    :precondition (and (manipulator ?a) (at ?a ?loc) (holding ?a ?p) (storage ?loc) (inspected ?p))
    :effect (and (at-part ?p ?loc) (not (holding ?a ?p)) (handempty ?a))
  )

  ; Manipulator assembles a held part at an assembly station (adds assembled flag)
  (:action assemble
    :parameters (?a - agent ?p - part ?loc - loc)
    :precondition (and (manipulator ?a) (at ?a ?loc) (holding ?a ?p) (assembly-station ?loc) (not (assembled ?p)))
    :effect (and (assembled ?p))
  )

  ; Inspector inspects a part that is located at an inspection station; requires assembly first
  (:action inspect
    :parameters (?insp - agent ?p - part ?loc - loc)
    :precondition (and (inspector ?insp) (at ?insp ?loc) (at-part ?p ?loc) (inspection-station ?loc) (assembled ?p) (not (inspected ?p)))
    :effect (and (inspected ?p))
  )

  ; Auditor performs final audit on a part that is in storage and has been assembled+inspected
  (:action audit
    :parameters (?aud - agent ?p - part ?loc - loc)
    :precondition (and (auditor ?aud) (at ?aud ?loc) (at-part ?p ?loc) (storage ?loc) (assembled ?p) (inspected ?p) (not (audited ?p)))
    :effect (and (audited ?p))
  )
)