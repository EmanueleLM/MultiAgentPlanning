(define (domain mysteryblocksworld9)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (harmony)
    (pain)
    (craves ?src - obj ?tgt - obj)
    ;; marker recording which province/planet pair was attacked so Succumb can restore the same pair
    (attacked ?prov - obj ?pl - obj)
    ;; explicit stage progression: exactly one current stage holds at any time and actions advance it
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Attack: requires a specific province, a specific planet, and global harmony.
  ;; Produces pain and records which province/planet pair was attacked. Consumes the province, the planet, and harmony.
  ;; Advances the current stage to its successor.
  (:action attack
    :parameters (?prov - obj ?pl - obj ?s - stage ?s2 - stage)
    :precondition (and (province ?prov) (planet ?pl) (harmony) (current ?s) (next ?s ?s2))
    :effect (and
      (pain)
      (attacked ?prov ?pl)
      (not (province ?prov))
      (not (planet ?pl))
      (not (harmony))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Succumb: requires pain and the attacked marker for a specific pair (ensures restoration targets the same objects).
  ;; Restores that province and planet and harmony, removes pain and the attacked marker.
  ;; Advances the current stage to its successor.
  (:action succumb
    :parameters (?prov - obj ?pl - obj ?s - stage ?s2 - stage)
    :precondition (and (pain) (attacked ?prov ?pl) (current ?s) (next ?s ?s2))
    :effect (and
      (province ?prov)
      (planet ?pl)
      (harmony)
      (not (pain))
      (not (attacked ?prov ?pl))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Overcome: requires that ?other currently holds a province and there is pain.
  ;; Grants harmony, gives province to ?obj, and makes ?obj crave ?other.
  ;; Removes the other province and pain.
  ;; Advances the current stage to its successor.
  (:action overcome
    :parameters (?obj - obj ?other - obj ?s - stage ?s2 - stage)
    :precondition (and (province ?other) (pain) (current ?s) (next ?s ?s2))
    :effect (and
      (harmony)
      (province ?obj)
      (craves ?obj ?other)
      (not (province ?other))
      (not (pain))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Feast: requires a craving from ?src to ?tgt, that ?src holds province, and harmony.
  ;; Produces pain and transfers province to the other object (?tgt).
  ;; Removes the craving, the src's province, and harmony.
  ;; Advances the current stage to its successor.
  (:action feast
    :parameters (?src - obj ?tgt - obj ?s - stage ?s2 - stage)
    :precondition (and (craves ?src ?tgt) (province ?src) (harmony) (current ?s) (next ?s ?s2))
    :effect (and
      (pain)
      (province ?tgt)
      (not (craves ?src ?tgt))
      (not (province ?src))
      (not (harmony))
      (not (current ?s))
      (current ?s2)
    )
  )
)