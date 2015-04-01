<?php
App::uses ( 'AppModel', 'Model' );
App::uses('CaptchaText', 'CaptchaCreator.Lib');

/**
 * User Model
 *
 * @property UserProfile $UserProfile
 * @property Group $Group
 */
class User extends AppModel {

	/**
	 * Display field
	 *
	 * @var string
	 */
	public $displayField = 'username';

	/**
	 * Validation rules
	 *
	 * @var array
	 */
	public $validate =
		array (
			'username' =>
				array (
					'notEmpty' =>
						array (
							'rule' =>
								array (
									'notEmpty'
								)
							// 'message' => 'Your custom message here',
							// 'allowEmpty' => false,
							// 'required' => false,
							// 'last' => false, // Stop validation after this rule
							// 'on' => 'create', // Limit validation to 'create' or 'update' operations
						),
					'noDuplicates' =>
						array (
							'rule' => array (
									'noDuplicates'
							),
							'message' => 'This username s already in use. Select "Forgot Password" to reset your password'
						)
			),
			'password' => array (
					'notEmpty' => array (
							'rule' => array (
									'notEmpty'
							)
					// 'message' => 'Your custom message here',
					// 'allowEmpty' => false,
					// 'required' => false,
					// 'last' => false, // Stop validation after this rule
					// 'on' => 'create', // Limit validation to 'create' or 'update' operations
										)
			),
			'confirm_password' =>
				array (
					'equaltofield' =>
						array (
							'rule' =>
								array (
									'equaltofield',
									'password'
								),
								'message' => 'Must match your passowrd. Please re-type.',
								// 'allowEmpty' => false,
								// 'required' => false,
								// 'last' => false, // Stop validation after this rule
								'on' => 'create'  // Limit validation to 'create' or 'update' operations
						)
				),

	);


	function equaltofield($check, $otherfield) {
		// get name of field
		$fname = '';
		foreach ( $check as $key => $value ) {
			$fname = $key;
			break;
		}
		return $this->data [$this->name] [$otherfield] === $this->data [$this->name] [$fname];
	}

	public function noDuplicates($check) {
		// $check will have value: array('user_name' => 'some-value')
		// $limit will have value: 25
		$existingUserCount = $this->find ( 'count', array (
				'conditions' => $check,
				'recursive' => - 1
		) );
		return $existingUserCount == 0;
	}
	// The Associations below have been created with all possible keys, those that are not needed can be removed

	/**
	 * hasOne associations
	 *
	 * @var array
	 */
	public $hasOne = array (
			'UserProfile' => array (
					'className' => 'UserProfile',
					'foreignKey' => 'user_id',
					'conditions' => '',
					'fields' => '',
					'order' => ''
			)
	);

	/**
	 * hasAndBelongsToMany associations
	 *
	 * @var array
	 */
	public $hasAndBelongsToMany = array (
			'Group' => array (
					'className' => 'Group',
					'joinTable' => 'users_groups',
					'foreignKey' => 'user_id',
					'associationForeignKey' => 'group_id',
					'unique' => 'keepExisting',
					'conditions' => '',
					'fields' => '',
					'order' => '',
					'limit' => '',
					'offset' => '',
					'finderQuery' => ''
			)
	);
}
