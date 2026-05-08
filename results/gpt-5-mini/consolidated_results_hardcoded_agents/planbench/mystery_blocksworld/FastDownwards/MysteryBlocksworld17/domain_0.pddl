(define (domain struggle)
  (:requirements :strips)
  (:predicates
    ;; world-state fluents
    (province ?o)
    (planet ?o)
    (craves ?o ?other)
    (harmony)
    (pain)
    ;; transient event tokens to enforce sequencing
    (attack-armed ?p ?pl)
    (attack-consumed ?p ?pl)
    (feast-armed ?a ?b)
    (feast-consumed ?a ?b)
    (succumb-armed ?p ?pl)
    (overcome-armed ?obj ?other)
    (overcome-transferred ?obj ?other)
  )

  ;; Attack is modeled as a three-step causal sequence:
  ;; 1) arm the attack event
  ;; 2) consume the explicit province and planet targets
  ;; 3) cause pain and remove harmony (aftermath)
  (:action attack-init
    :parameters (?p ?pl)
    :precondition (and (province ?p) (planet ?pl) (harmony))
    :effect (and (attack-armed ?p ?pl))
  )

  (:action attack-consume
    :parameters (?p ?pl)
    :precondition (and (attack-armed ?p ?pl) (province ?p) (planet ?pl))
    :effect (and (not (province ?p)) (not (planet ?pl)) (attack-consumed ?p ?pl))
  )

  (:action attack-damage
    :parameters (?p ?pl)
    :precondition (and (attack-armed ?p ?pl) (attack-consumed ?p ?pl))
    :effect (and (pain) (not (harmony))
                 (not (attack-armed ?p ?pl)) (not (attack-consumed ?p ?pl)))
  )

  ;; Feast modeled as three-step causal sequence:
  ;; 1) arm the feast
  ;; 2) consume craving & move province from A -> B
  ;; 3) produce aftermath (pain and loss of harmony)
  (:action feast-init
    :parameters (?a ?b)
    :precondition (and (craves ?a ?b) (province ?a) (harmony))
    :effect (and (feast-armed ?a ?b))
  )

  (:action feast-consume
    :parameters (?a ?b)
    :precondition (and (feast-armed ?a ?b) (craves ?a ?b) (province ?a))
    :effect (and (not (craves ?a ?b)) (not (province ?a)) (province ?b) (feast-consumed ?a ?b))
  )

  (:action feast-aftermath
    :parameters (?a ?b)
    :precondition (and (feast-armed ?a ?b) (feast-consumed ?a ?b))
    :effect (and (pain) (not (harmony))
                 (not (feast-armed ?a ?b)) (not (feast-consumed ?a ?b)))
  )

  ;; Succumb modeled as a two-step recovery sequence:
  ;; 1) arm the recovery (select which object pair to restore)
  ;; 2) resolve pain and restore province/planet/harmony for the chosen pair
  (:action succumb-init
    :parameters (?p ?pl)
    :precondition (and (pain))
    :effect (and (succumb-armed ?p ?pl))
  )

  (:action succumb-restore
    :parameters (?p ?pl)
    :precondition (and (succumb-armed ?p ?pl))
    :effect (and (not (pain)) (harmony) (province ?p) (planet ?pl)
                 (not (succumb-armed ?p ?pl)))
  )

  ;; Overcome modeled as a four-step causal sequence:
  ;; 1) arm the overcome (requires pain and that 'other' has a province)
  ;; 2) transfer province from other -> object
  ;; 3) generate the craving as an effect of the transfer
  ;; 4) soothe pain and reestablish harmony (aftermath)
  (:action overcome-init
    :parameters (?obj ?other)
    :precondition (and (pain) (province ?other))
    :effect (and (overcome-armed ?obj ?other))
  )

  (:action overcome-transfer
    :parameters (?obj ?other)
    :precondition (and (overcome-armed ?obj ?other) (province ?other))
    :effect (and (not (province ?other)) (province ?obj) (overcome-transferred ?obj ?other))
  )

  (:action overcome-generate-craving
    :parameters (?obj ?other)
    :precondition (and (overcome-transferred ?obj ?other))
    :effect (and (craves ?obj ?other))
  )

  (:action overcome-soothe
    :parameters (?obj ?other)
    :precondition (and (overcome-armed ?obj ?other) (overcome-transferred ?obj ?other))
    :effect (and (not (pain)) (harmony)
                 (not (overcome-armed ?obj ?other)) (not (overcome-transferred ?obj ?other)))
  )
)