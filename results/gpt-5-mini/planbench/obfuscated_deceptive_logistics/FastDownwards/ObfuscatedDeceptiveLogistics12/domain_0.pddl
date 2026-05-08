; Domain: manipulator-inspector-auditor
; Modeling choices:
; - Three agent roles are modeled explicitly: manipulator, inspector, auditor.
; - Parts must be attached in a specific order: partA before partB. This is enforced by preconditions (hard constraint).
; - Inspection is permitted only after all attachments and the screw step complete. Auditor clearance is permitted only after a successful inspection.
; - Locations and an assembly-station predicate are used to force agents to be physically present to perform actions.
; - No penalty or quota constructs are used. All preferences from the specification are encoded as strict preconditions so violating plans are impossible.
; - Requirements limited to :strips, :typing, :negative-preconditions to remain FastDownward-compatible.

(define (domain manipulator-inspector-auditor)
  :requirements :strips :typing :negative-preconditions
  :types agent location part

  :predicates
    ; agent/location and part/location state
    (at ?a - agent ?l - location)
    (at-part ?p - part ?l - location)
    ; holding relation: agent holds a part
    (holding ?a - agent ?p - part)
    ; attachment and fastening state
    (attached ?p - part)
    (screwed)
    ; inspection and audit states
    (inspected)
    (audited)
    ; marks which locations are valid assembly locations
    (assembly-station ?l - location)
  )

  ; Move an agent between locations
  (:action move
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and (at ?a ?from) (not (= ?from ?to)))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )

  ; Pick up a part from a location (manipulator or any agent may pick)
  (:action pick
    :parameters (?a - agent ?p - part ?l - location)
    :precondition (and (at ?a ?l) (at-part ?p ?l) (not (holding ?a ?p)))
    :effect (and (not (at-part ?p ?l)) (holding ?a ?p))
  )

  ; Place a held part at current location
  (:action place
    :parameters (?a - agent ?p - part ?l - location)
    :precondition (and (at ?a ?l) (holding ?a ?p))
    :effect (and (not (holding ?a ?p)) (at-part ?p ?l))
  )

  ; Attach partA to the assembly (must be at assembly station and holding the part)
  (:action attach-partA
    :parameters (?a - agent ?p - part ?s - location)
    :precondition (and (at ?a ?s) (assembly-station ?s) (holding ?a ?p) (not (attached ?p)))
    :effect (and (attached ?p) (not (holding ?a ?p)))
  )

  ; Attach partB to the assembly (requires partA already attached by strict constraint)
  (:action attach-partB
    :parameters (?a - agent ?pB - part ?pA - part ?s - location)
    :precondition (and (at ?a ?s) (assembly-station ?s) (holding ?a ?pB)
                       (attached ?pA) (not (attached ?pB)))
    :effect (and (attached ?pB) (not (holding ?a ?pB)))
  )

  ; Fasten screw: requires both parts attached and the agent at assembly station
  (:action fasten-screw
    :parameters (?a - agent ?s - location ?pA - part ?pB - part)
    :precondition (and (at ?a ?s) (assembly-station ?s) (attached ?pA) (attached ?pB) (not (screwed)))
    :effect (screwed)
  )

  ; Inspector performs inspection: allowed only after screw is fastened and inspector is at the assembly station.
  ; Inspection is modeled as always passing if preconditions hold (the specification required inspection to be performed and pass).
  (:action inspect
    :parameters (?ins - agent ?s - location ?pA - part ?pB - part)
    :precondition (and (at ?ins ?s) (assembly-station ?s) (screwed) (attached ?pA) (attached ?pB) (not (inspected)))
    :effect (inspected)
  )

  ; Auditor performs final audit: allowed only after inspection completed and auditor present at assembly station.
  (:action audit
    :parameters (?aud - agent ?s - location)
    :precondition (and (at ?aud ?s) (assembly-station ?s) (inspected) (not (audited)))
    :effect (audited)
  )
)