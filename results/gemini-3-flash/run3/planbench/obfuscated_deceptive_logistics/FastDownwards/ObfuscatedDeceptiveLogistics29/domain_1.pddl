(define (domain obfuscated_deceptive_logistics_29)
  (:requirements :strips :typing)
  (:types agent location group - object)

  (:predicates
    (hand ?a - agent)
    (cats ?l - location)
    (sneeze ?l - location)
    (spring ?l - location)
    (texture ?l - location)
    (stupendous ?g - group)
    (collect ?l - location ?g - group)
    (vase ?a - agent ?l - location)
    (next ?o - object ?l - location)
  )

  (:action paltry
    :parameters (?a - agent ?l_cat - location ?l_tex - location)
    :precondition (and 
      (hand ?a) 
      (cats ?l_cat) 
      (texture ?l_tex) 
      (vase ?a ?l_cat) 
      (next ?l_cat ?l_tex)
    )
    :effect (and 
      (next ?a ?l_tex) 
      (not (vase ?a ?l_cat))
    )
  )

  (:action sip
    :parameters (?a - agent ?l_cat - location ?l_tex - location)
    :precondition (and 
      (hand ?a) 
      (cats ?l_cat) 
      (texture ?l_tex) 
      (next ?a ?l_tex) 
      (next ?l_cat ?l_tex)
    )
    :effect (and 
      (vase ?a ?l_cat) 
      (not (next ?a ?l_tex))
    )
  )

  (:action clip
    :parameters (?a - agent ?l_snz - location ?l_tex - location)
    :precondition (and 
      (hand ?a) 
      (sneeze ?l_snz) 
      (texture ?l_tex) 
      (next ?l_snz ?l_tex) 
      (next ?a ?l_tex)
    )
    :effect (and 
      (vase ?a ?l_snz) 
      (not (next ?a ?l_tex))
    )
  )

  (:action wretched
    :parameters (?l_snz - location ?l_tex1 - location ?l_tex2 - location ?g - group)
    :precondition (and 
      (sneeze ?l_snz) 
      (texture ?l_tex1) 
      (texture ?l_tex2) 
      (stupendous ?g) 
      (next ?l_snz ?l_tex1) 
      (collect ?l_tex1 ?g) 
      (collect ?l_tex2 ?g)
    )
    :effect (and 
      (next ?l_snz ?l_tex2) 
      (not (next ?l_snz ?l_tex1))
    )
  )

  (:action memory
    :parameters (?l_cat - location ?l_spr1 - location ?l_spr2 - location)
    :precondition (and 
      (cats ?l_cat) 
      (spring ?l_spr1) 
      (spring ?l_spr2) 
      (next ?l_cat ?l_spr1)
    )
    :effect (and 
      (next ?l_cat ?l_spr2) 
      (not (next ?l_cat ?l_spr1))
    )
  )

  (:action tightfisted
    :parameters (?a - agent ?l_snz - location ?l_tex - location)
    :precondition (and 
      (hand ?a) 
      (sneeze ?l_snz) 
      (texture ?l_tex) 
      (next ?l_snz ?l_tex) 
      (vase ?a ?l_snz)
    )
    :effect (and 
      (next ?a ?l_tex) 
      (not (vase ?a ?l_snz))
    )
  )
)