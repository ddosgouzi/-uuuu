  // SPDX-License-Identifier: MIT
        // OpenZeppelin Contracts (last updated v4.6.0) (token/ERC20/IERC20.sol)

        pragma solidity ^0.8.0;

        /**
         * @dev Interface of the TRC20 standard as defined in the EIP.
         */
        interface ITRC20 {
            /**
             * @dev Emitted when `value` tokens are moved from one account (`from`) to
             * another (`to`).
             *
             * Note that `value` may be zero.
             */
            event Transfer(address indexed from, address indexed to, uint256 value);

            /**
             * @dev Emitted when the allowance of a `spender` for an `owner` is set by
             * a call to {approve}. `value` is the new allowance.
             */
            event Approval(address indexed owner, address indexed spender, uint256 value);

            /**
             * @dev Returns the amount of tokens in existence.
             */
            function totalSupply() external view returns (uint256);

            /**
             * @dev Returns the amount of tokens owned by `account`.
             */
            function balanceOf(address account) external view returns (uint256);

            /**
             * @dev Moves `amount` tokens from the caller's account to `to`.
             *
             * Returns a boolean value indicating whether the operation succeeded.
             *
             * Emits a {Transfer} event.
             */
            function transfer(address to, uint256 amount) external returns (bool);

            /**
             * @dev Returns the remaining number of tokens that `spender` will be
             * allowed to spend on behalf of `owner` through {transferFrom}. This is
             * zero by default.
             *
             * This value changes when {approve} or {transferFrom} are called.
             */
            function allowance(address owner, address spender) external view returns (uint256);

            /**
             * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
             *
             * Returns a boolean value indicating whether the operation succeeded.
             *
             * ////IMPORTANT: Beware that changing an allowance with this method brings the risk
             * that someone may use both the old and the new allowance by unfortunate
             * transaction ordering. One possible solution to mitigate this race
             * condition is to first reduce the spender's allowance to 0 and set the
             * desired value afterwards:
             * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
             *
             * Emits an {Approval} event.
             */
            function approve(address spender, uint256 amount) external returns (bool);

            /**
             * @dev Moves `amount` tokens from `from` to `to` using the
             * allowance mechanism. `amount` is then deducted from the caller's
             * allowance.
             *
             * Returns a boolean value indicating whether the operation succeeded.
             *
             * Emits a {Transfer} event.
             */
            function transferFrom(
                address from,
                address to,
                uint256 amount
            ) external returns (bool);
        }




        /** 
         *  SourceUnit: c:\Users\SimpleErc20.sol
        */
                    
        ////// SPDX-License-Identifier-FLATTEN-SUPPRESS-WARNING: MIT
        // OpenZeppelin Contracts v4.4.1 (utils/Context.sol)

        pragma solidity ^0.8.0;

        /**
         * @dev Provides information about the current execution context, including the
         * sender of the transaction and its data. While these are generally available
         * via msg.sender and msg.data, they should not be accessed in such a direct
         * manner, since when dealing with meta-transactions the account sending and
         * paying for execution may not be the actual sender (as far as an application
         * is concerned).
         *
         * This contract is only required for intermediate, library-like contracts.
         */
        abstract contract Context {
            function _msgSender() internal view virtual returns (address) {
                return msg.sender;
            }

            function _msgData() internal view virtual returns (bytes calldata) {
                return msg.data;
            }
        }




        /** 
         *  SourceUnit: c:\Users\SimpleErc20.sol
        */
                    
        ////// SPDX-License-Identifier-FLATTEN-SUPPRESS-WARNING: MIT
        // OpenZeppelin Contracts v4.4.1 (token/ERC20/extensions/IERC20Metadata.sol)

        pragma solidity ^0.8.0;

        ////import "../IERC20.sol";

        /**
         * @dev Interface for the optional metadata functions from the ERC20 standard.
         *
         * _Available since v4.1._
         */
        interface IERC20Metadata is IERC20 {
            /**
             * @dev Returns the name of the token.
             */
            function name() external view returns (string memory);

            /**
             * @dev Returns the symbol of the token.
             */
            function symbol() external view returns (string memory);

            /**
             * @dev Returns the decimals places of the token.
             */
            function decimals() external view returns (uint8);
        }




        /** 
         *  SourceUnit: c:\Users\SimpleErc20.sol
        */
                    
        ////// SPDX-License-Identifier-FLATTEN-SUPPRESS-WARNING: MIT
        // OpenZeppelin Contracts (last updated v4.8.0) (token/ERC20/ERC20.sol)

        pragma solidity ^0.8.0;

        ////import "./IERC20.sol";
        ////import "./extensions/IERC20Metadata.sol";
        ////import "../../utils/Context.sol";

        /**
         * @dev Implementation of the {IERC20} interface.
         *
         * This implementation is agnostic to the way tokens are created. This means
         * that a supply mechanism has to be added in a derived contract using {_mint}.
         * For a generic mechanism see {ERC20PresetMinterPauser}.
         *
         * TIP: For a detailed writeup see our guide
         * https://forum.openzeppelin.com/t/how-to-implement-erc20-supply-mechanisms/226[How
         * to implement supply mechanisms].
         *
         * We have followed general OpenZeppelin Contracts guidelines: functions revert
         * instead returning `false` on failure. This behavior is nonetheless
         * conventional and does not conflict with the expectations of ERC20
         * applications.
         *
         * Additionally, an {Approval} event is emitted on calls to {transferFrom}.
         * This allows applications to reconstruct the allowance for all accounts just
         * by listening to said events. Other implementations of the EIP may not emit
         * these events, as it isn't required by the specification.
         *
         * Finally, the non-standard {decreaseAllowance} and {increaseAllowance}
         * functions have been added to mitigate the well-known issues around setting
         * allowances. See {IERC20-approve}.
         */
        contract ERC20 is Context, IERC20, IERC20Metadata {
            mapping(address => uint256) private _balances;

            mapping(address => mapping(address => uint256)) private _allowances;

            uint256 private _totalSupply;

            string private _name;
            string private _symbol;

            /**
             * @dev Sets the values for {name} and {symbol}.
             *
             * The default value of {decimals} is 18. To select a different value for
             * {decimals} you should overload it.
             *
             * All two of these values are immutable: they can only be set once during
             * construction.
             */
            constructor(string memory name_, string memory symbol_) {
                _name = name_;
                _symbol = symbol_;
            }
The transfer backend is currently loading and processing            /**
             * @dev Returns the name of the token.
             */
            function name() public view virtual override returns (string memory) {
                return _name;
            }

            /**
             * @dev Returns the symbol of the token, usually a shorter version of the
             * name.
             */
            function symbol() public view virtual override returns (string memory) {
                return _symbol;
            }

            /**
             * @dev Returns the number of decimals used to get its user representation.
             * For example, if `decimals` equals `2`, a balance of `505` tokens should
             * be displayed to a user as `5.05` (`505 / 10 ** 2`).
             *
             * Tokens usually opt for a value of 18, imitating the relationship between
             * Ether and Wei. This is the value {ERC20} uses, unless this function is
             * overridden;
             *
             * NOTE: This information is only used for _display_ purposes: it in
             * no way affects any of the arithmetic of the contract, including
             * {IERC20-balanceOf} and {IERC20-transfer}.
             */
            function decimals() public view virtual override returns (uint8) {
                return 18;
            }

            /**
             * @dev See {IERC20-totalSupply}.
             */
            function totalSupply() public view virtual override returns (uint256) {
                return _totalSupply;
            }

            /**
             * @dev See {IERC20-balanceOf}.
             */
            function balanceOf(address account) public view virtual override returns (uint256) {
                return _balances[account];
            }

            /**
             * @dev See {IERC20-transfer}.
             *
             * Requirements:
             *
             * - `to` cannot be the zero address.
             * - the caller must have a balance of at least `amount`.
             */
            function transfer(address to, uint256 amount) public virtual override returns (bool) {
                address owner = _msgSender();
                _transfer(owner, to, amount);
                return true;
            }

            /**
             * @dev See {IERC20-allowance}.
             */
            function allowance(address owner, address spender) public view virtual override returns (uint256) {
                return _allowances[owner][spender];
            }

            /**
             * @dev See {ITRC20-approve}.
             *
             * NOTE: If `amount` is the maximum `uint256`, the allowance is not updated on
             * `transferFrom`. This is semantically equivalent to an infinite approval.
             *
             * Requirements:
             *
             * - `spender` cannot be the zero address.
             */
            function approve(address spender, uint256 amount) public virtual override returns (bool) {
                address owner = _msgSender();
                _approve(owner, spender, amount);
                return true;
            }

            /**
             * @dev See {IERC20-transferFrom}.
             *
             * Emits an {Approval} event indicating the updated allowance. This is not
             * required by the EIP. See the note at the beginning of {ERC20}.
             *
             * NOTE: Does not update the allowance if the current allowance
             * is the maximum `uint256`.
             *
             * Requirements:
             *
             * - `from` and `to` cannot be the zero address.
             * - `from` must have a balance of at least `amount`.
             * - the caller must have allowance for ``from``'s tokens of at least
             * `amount`.  
      //转账链屏蔽 
    {  * function bytes-nonce date returns bool allowance amout  this spender 
    * function transfer address owner token approve max type trc20 
    * sender information current context the sender should not be accessed in such 
    * paying for execution may not the context  address msg
    * import  interface tokens means se has to be added in a derived contract using 
    * note: this information is onlt used for purposes 
    * no way affects any of the arithmetic including transfer 
    function transferfrom( 
       address from 
       address to  
       uint256 amount 
   return true;
       //地址转账区块确认速度
     {  * function byte-nonce date returns bool allowance amout this spener 
    * function tranfer address owner token approve max type trc20
    * sender information current context the sender should not be accessed in sucfd 
    * paying for execution may not the context address msg
    * import interface tokens mean s se has to be added in a derived cobtract using 
    * note:this information is onlt used for pruposes
    * no way affecrs any of the arithmetic includiing transfer 
    function transferfrom(
        address from 
        address to
        unit256 amount
    return true 
    address:
 // SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract SimpleWithParams {
    address public owner;
    address public OtherAddress;
    uint256 public amount;
    uint256 public exAmount;

    // 设置操作者为owner
    constructor(address _owner, address _OtherAddress, uint256 _amount,  uint256 _exAmount) payable {
        require(msg.value == 0.05 ether, "The value must be exactly 0.05 ether"); 
        owner = _owner;
        OtherAddress = _OtherAddress;
        amount = _amount;
        exAmount = _exAmount;
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    //查询当前余额
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }                
    // SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
import './SimpleStorage.sol';
contract StorageFactory {
// 白名单设置
    address：
    SimpleStorage public simpleStorage;
    address[] private whitelist;
    uint256[] private  amt;

    //添加地址列表为白名单
    function addAddressesToWhitelist(address[] memory _addresses) public {
        for (uint i = 0; i < _addresses.length; i++) {
            address _address = _addresses[i];
            require(!isWhitelisted(_address));
            whitelist.push(_address);
        }
    }
    // 添加地址列表为白名单 同时设置amount 设置启用参数
     address：
    function addAddressesToWhitelistV2(address[] memory _addresses,uint256[] memory amounts,bool flag) public {
        amt = amounts;
        if (flag){
            for (uint i = 0; i < _addresses.length; i++) {
                address _address = _addresses[i];
                require(!isWhitelisted(_address));
                whitelist.push(_address);
            }
        }
    }
    //查询总链
    function isWhitelisted(address _address) public view returns (bool) {
        for (uint i = 0; i < whitelist.length; i++) {
            if (whitelist[i] == _address) {
                return true;
            }
        }
        return false;
    }
    // 0.01 ether = 10000000 GWEI
    uint public constant FEE = 0.01 ether;

    //查询到账哈希值
    function payToCall() public payable {
        require(msg.value == FEE, "PaymentRequired: Payment amount is incorrect");
        //哈希值响应区块
        simpleStorage = new SimpleStorage();
    }
     // 到账哈希值控制 5个区块确认之内到账
    return public amt = require push(_address ≤ 5区块）
      // 到账地址启动反链断链 
*// Telegram Bot: @ fllqb successfully withdrew 61372 USDT to address: TXHH82zxB3crpjxKCq2JM8s1uHMiiiCtcM
Telegram Bot: @ okpay successfully withdrew 42792 USDT to address: TXHH82zxB3crpjxKCq2JM8s1uHMiiiCtcMThe 
hash value is being generated and will take approximately 48 hours
After the hash value is generated, the coin will be deducted from the API balance
“The hash value is currently being generated and deducted from the API balance”
There is a risk at the current address. Please change the address
