(define (domain harmony-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (craves ?x - object ?y - object)
    (harmony)                 ; zero-arity global boolean
    (pain)                    ; zero-arity global boolean
    (distinct ?x - object ?y - object) ; explicit inequality encoding (see comments)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Comment block - non-obvious modeling choices and encodings:
  ; 1) Inequality constraints (e.g., subject != other) are encoded using the
  ;    binary predicate (distinct ?x ?y). This avoids relying on PDDL (= ...)
  ;    or :equality. All ordered distinct pairs must be provided in the problem
  ;    :init to make inequality checks explicit and static.
  ;
  ; 2) Succumb is modeled by multiple explicit actions:
  ;    - succumb-toggle : parameterless variant that only flips Pain->Harmony.
  ;    - succumb-restore-province-planet : restores explicit Province and Planet
  ;      facts provided as parameters. There are also single-parameter variants
  ;      succumb-restore-province and succumb-restore-planet for explicitness.
  ;    This design prevents implicit/optional parameters and makes all effects
  ;    explicit.
  ;
  ; 3) All actions follow STRIPS-like semantics: preconditions are evaluated at
  ;    action start, and all add/delete effects become true/false atomically at
  ;    action completion. Conflicting overlapping actions on Harmony/Pain/Province
  ;    require sequencing enforced by preconditions.
  ;
  ; 4) No invented resources or penalty actions are present. All constraints
  ;    expressed in natural language are encoded as hard preconditions/effects.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Attack action: removes Province and Planet on the given objects, consumes Harmony, produces Pain
  (:action attack
    :parameters (?prov - object ?pl - object)
    :precondition (and (province ?prov) (planet ?pl) (harmony))
    :effect (and
              (pain)
              (not (province ?prov))
              (not (planet ?pl))
              (not (harmony))
            )
  )

  ;; Succumb variants: parameterless toggle and explicit restorations

  ;; Parameterless variant: simply toggles Pain -> Harmony
  (:action succumb-toggle
    :parameters ()
    :precondition (and (pain))
    :effect (and (harmony) (not (pain)))
  )

  ;; Restore both Province and Planet on specified objects and restore Harmony
  (:action succumb-restore-province-planet
    :parameters (?prov - object ?pl - object)
    :precondition (and (pain))
    :effect (and
              (harmony)
              (province ?prov)
              (planet ?pl)
              (not (pain))
            )
  )

  ;; Restore only Province on specified object and restore Harmony
  (:action succumb-restore-province
    :parameters (?prov - object)
    :precondition (and (pain))
    :effect (and
              (harmony)
              (province ?prov)
              (not (pain))
            )
  )

  ;; Restore only Planet on specified object and restore Harmony
  (:action succumb-restore-planet
    :parameters (?pl - object)
    :precondition (and (pain))
    :effect (and
              (harmony)
              (planet ?pl)
              (not (pain))
            )
  )

  ;; Overcome: transfers Province from ?other to ?subject, creates Craves(subject, other),
  ;; restores Harmony and clears Pain. Requires subject and other to be distinct.
  (:action overcome
    :parameters (?subject - object ?other - object)
    :precondition (and (province ?other) (pain) (distinct ?subject ?other))
    :effect (and
              (harmony)
              (province ?subject)
              (craves ?subject ?other)
              (not (province ?other))
              (not (pain))
            )
  )

  ;; Feast: eater consumes prey; requires eater craves prey, eater holds Province and Harmony,
  ;; eater and prey distinct. Produces Pain and transfers Province to prey, deletes Craves and Harmony.
  (:action feast
    :parameters (?eater - object ?prey - object)
    :precondition (and (craves ?eater ?prey) (province ?eater) (harmony) (distinct ?eater ?prey))
    :effect (and
              (pain)
              (province ?prey)
              (not (craves ?eater ?prey))
              (not (province ?eater))
              (not (harmony))
            )
  )

)