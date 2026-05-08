(define (domain harmony-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (craves ?x - object ?y - object)
    (harmony)                 ; global boolean
    (pain)                    ; global boolean
    (distinct ?x - object ?y - object) ; explicit inequality encoding (all ordered unequal pairs must appear in :init)
    (current ?s - stage)      ; current discrete stage/timepoint
    (next ?s - stage ?s2 - stage) ; static successor relation between stages
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Modeling notes (inside domain):
  ; - Discrete linear time: actions explicitly move the current stage forward.
  ;   Every action requires (current ?t) and a static (next ?t ?t2) and
  ;   effects atomically replace (current ?t) with (current ?t2).
  ;   This enforces a strict ordering of actions with no implicit oscillation
  ;   or post-hoc fixes.
  ;
  ; - No bookkeeping shortcuts: a single Succumb action performs all restores
  ;   required by the specification. No auxiliary "toggle" variants or
  ;   "pay shortfall" actions exist.
  ;
  ; - Inequality is encoded via (distinct ...) predicate. All ordered pairs for
  ;   unequal objects must be included in the problem :init.
  ;
  ; - All preconditions and effects mandated by the human specification are
  ;   encoded as hard preconditions/effects. Effects are STRIPS-style atomic
  ;   add/delete lists applied at the stage transition.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Attack action
  (:action attack
    :parameters (?prov - object ?pl - object ?t - stage ?t2 - stage)
    :precondition (and
                    (province ?prov)
                    (planet ?pl)
                    (harmony)
                    (current ?t)
                    (next ?t ?t2)
                  )
    :effect (and
              (pain)
              (not (province ?prov))
              (not (planet ?pl))
              (not (harmony))
              (not (current ?t))
              (current ?t2)
            )
  )

  ;; Succumb action: restores Province and Planet (for given objects) and Harmony, clears Pain
  (:action succumb
    :parameters (?prov - object ?pl - object ?t - stage ?t2 - stage)
    :precondition (and
                    (pain)
                    (current ?t)
                    (next ?t ?t2)
                  )
    :effect (and
              (harmony)
              (province ?prov)
              (planet ?pl)
              (not (pain))
              (not (current ?t))
              (current ?t2)
            )
  )

  ;; Overcome: requires province on ?other and Pain; gives Harmony, Province to ?subject and makes ?subject crave ?other,
  ;; removes Province on ?other and clears Pain. Enforces distinctness subject != other.
  (:action overcome
    :parameters (?subject - object ?other - object ?t - stage ?t2 - stage)
    :precondition (and
                    (province ?other)
                    (pain)
                    (distinct ?subject ?other)
                    (current ?t)
                    (next ?t ?t2)
                  )
    :effect (and
              (harmony)
              (province ?subject)
              (craves ?subject ?other)
              (not (province ?other))
              (not (pain))
              (not (current ?t))
              (current ?t2)
            )
  )

  ;; Feast: requires craves(eater, prey), eater holds Province and Harmony; produces Pain and gives Province to prey;
  ;; deletes the craves relation, removes Province from eater and removes Harmony. Enforces distinctness eater != prey.
  (:action feast
    :parameters (?eater - object ?prey - object ?t - stage ?t2 - stage)
    :precondition (and
                    (craves ?eater ?prey)
                    (province ?eater)
                    (harmony)
                    (distinct ?eater ?prey)
                    (current ?t)
                    (next ?t ?t2)
                  )
    :effect (and
              (pain)
              (province ?prey)
              (not (craves ?eater ?prey))
              (not (province ?eater))
              (not (harmony))
              (not (current ?t))
              (current ?t2)
            )
  )

)